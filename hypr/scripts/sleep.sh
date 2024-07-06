#!/bin/bash

swayidle -w timeout 120 'swaylock -f -c 000000' \
            timeout 300 'systemctl suspend' \
            before-sleep 'swaylock -f -c 000000' &
