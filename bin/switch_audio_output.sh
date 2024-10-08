#!/bin/bash

# Obtener el dispositivo de salida predeterminado actual
current_sink=$(pactl get-default-sink)

# Establecer el nombre de tus dispositivos de salida (casco y altavoces)
headphones_sink="alsa_output.usb-Logitech_G733_Gaming_Headset_0000000000000000-00.pro-output-0"
speakers_sink="alsa_output.usb-Lexicon_Lexicon_Alpha-00.iec958-stereo"

# Cambiar entre auriculares y altavoces
if [ "$current_sink" = "$headphones_sink" ]; then
    pactl set-default-sink "$speakers_sink"
    notify-send "Audio Output" "Switched to Speakers"
else
    pactl set-default-sink "$headphones_sink"
    notify-send "Audio Output" "Switched to Headphones"
fi

# Mover todas las aplicaciones actuales al nuevo sink
for input in $(pactl list short sink-inputs | cut -f1); do
    pactl move-sink-input "$input" "$(pactl get-default-sink)"
done
