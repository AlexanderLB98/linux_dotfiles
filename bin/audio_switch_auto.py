#!/usr/bin/env python
import subprocess


def parse_wpctl_status():
    """
    Parses the output of the "wpctl status" command to extract sink IDs and names.
    Returns a list of dictionaries with "sink_id" and "sink_name".
    """
    output = str(subprocess.check_output("wpctl status", shell=True, encoding="utf-8"))

    lines = (
        output.replace("├", "")
        .replace("─", "")
        .replace("│", "")
        .replace("└", "")
        .splitlines()
    )

    sinks_index = next(
        (index for index, line in enumerate(lines) if "Sinks:" in line), None
    )
    if sinks_index is None:
        return []

    sinks = []
    for line in lines[sinks_index + 1 :]:
        if not line.strip():
            break
        sinks.append(line.strip())

    for index, sink in enumerate(sinks):
        sinks[index] = sink.split("[vol:")[0].strip()

    sinks_dict = []
    for sink in sinks:
        sink_parts = sink.split(".", 1)
        is_default = sink_parts[0].startswith("*")
        sink_id = sink_parts[0].replace("*", "").strip()
        if not sink_id.isdigit():
            continue
        sink_name = sink_parts[1].strip()
        sinks_dict.append(
            {"sink_id": int(sink_id), "sink_name": sink_name, "is_default": is_default}
        )

    return sinks_dict


def switch_sinks():
    """
    Filters for specific sinks and toggles between them.
    """
    target_sinks = ["Lexicon Alpha Analog Stereo", "G733 Gaming Headset Analog Stereo"]

    # Parse the current sinks and filter for the ones of interest
    sinks = parse_wpctl_status()
    filtered_sinks = [
        sink
        for sink in sinks
        if any(name in sink["sink_name"] for name in target_sinks)
    ]

    if len(filtered_sinks) != 2:
        print("Error: Could not find exactly two target sinks.")
        return

    # Determine the current default sink
    current_default = next(
        (sink for sink in filtered_sinks if sink["is_default"]), None
    )

    if not current_default:
        print("Error: No default sink found among target sinks.")
        return

    # Switch to the other sink
    next_sink = next(sink for sink in filtered_sinks if sink != current_default)
    subprocess.run(f"wpctl set-default {next_sink['sink_id']}", shell=True)
    print(f"Switched to: {next_sink['sink_name']}")


if __name__ == "__main__":
    switch_sinks()
