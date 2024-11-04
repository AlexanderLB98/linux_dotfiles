#!/usr/bin/env python3
import subprocess
import sys

def get_active_sink():
    try:
        output = subprocess.check_output("wpctl get-default-sink", shell=True, encoding="utf-8").strip()
        return output
    except subprocess.CalledProcessError:
        print("Error getting default sink: Command 'wpctl get-default-sink' failed.", file=sys.stderr)
        return None

def get_sink_icon(sink_name):
    if sink_name is None:
        return "󰖀 No active sink"  # Default icon for no active sink
    
    # Check specific sink names to determine the correct icon
    if "Logitech_G733_Gaming_Headset" in sink_name:
        return ""  # Headphones icon
    elif "Lexicon_Alpha" in sink_name:
        return "🔊"  # Speakers icon
    else:
        return "󰖀"  # Default icon for other sinks

# Main Logic
active_sink = get_active_sink()
icon = get_sink_icon(active_sink)

# Output the result
if active_sink:
    print(f"{icon} {active_sink}")
else:
    print(icon)  # Print the no active sink message

