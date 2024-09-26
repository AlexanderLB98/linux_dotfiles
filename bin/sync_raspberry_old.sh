#!/bin/bash

# Este script sincronizará mediante RCLONE desde mi PC al servidor de la RASPBERRY

ruta_local="/home/lucas"
#ruta_raspberry="/mnt/Raspberrypi1/raspberrypi1/shared/lucas_rsync_test/"
#ruta_raspberry="/home/lucas/smb/shared/lucas_rsync_test/"
ruta_raspberry="/home/lucas/smb/shared/lucas_rsync/"


rclone copy "$ruta_local" "$ruta_raspberry" --verbose --update

