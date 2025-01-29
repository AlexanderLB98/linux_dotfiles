#!/bin/bash
# Obtener el dispositivo de salida predeterminado actual
current_sink=$(pactl get-default-sink)
### To list the devices: pactl list sinks
### To obtain only the names: pactl list sinks | grep Name | awk '{print $2}'


# Establecer el nombre de tus dispositivos de salida
headphones_sink="alsa_output.usb-Logitech_G733_Gaming_Headset_0000000000000000-00.analog-stereo"
speakers_sink="bluez_output.48_5F_2D_47_6C_4D.1"
# speakers_sink="alsa_output.usb-Lexicon_Lexicon_Alpha-00.iec958-stereo"

# Determinar el estado actual y el icono
if [ "$current_sink" = "$headphones_sink" ]; then
    if [ "$1" = "check" ]; then
        active_output="Headphones"
        icon=""
    else
        pactl set-default-sink "$speakers_sink"
        notify-send "Audio Output" "Switched to Speakers"
        active_output="Speakers"
        icon="󰓃"
    fi
else
    if [ "$1" = "check" ]; then
        active_output="Speakers"
        icon="󰓃"
    else
        pactl set-default-sink "$headphones_sink"
        notify-send "Audio Output" "Switched to Headphones"
        active_output="Headphones"
        icon=""
    fi
fi

# Si no es una comprobación, mover todas las aplicaciones al nuevo sink
if [ "$1" != "check" ]; then
    for input in $(pactl list short sink-inputs | cut -f1); do
        pactl move-sink-input "$input" "$(pactl get-default-sink)"
    done
fi

# Obtener el volumen actual
volume=$(pactl get-sink-volume "$(pactl get-default-sink)" | awk '{print $5}' | sed 's/%//')

# Imprimir el estado actual en formato JSON para Waybar
echo "{\"text\": \"${volume}%\", \"class\": \"${active_output,,}\", \"icon\": \"$icon\", \"volume\": \"$volume\", \"device\": \"$active_output\"}"
