#!/bin/bash

# Este script sincronizará este pc (Linux) con el servidor Raspberrypi

# Rutas locales en tu PC Linux
#ruta_documentos="/home/lucas/Documentos"
#ruta_projects="/home/lucas/projects"
#ruta_imagenes="/home/lucas/Imagenes"
#ruta_bin="/home/lucas/bin"
#ruta_descargas="/home/lucas/Descargas"
ruta_lucas="/home/lucas"

# Rutas en la Raspberry Pi
ruta_raspberry="/mnt/Raspberrypi1/raspberrypi1/shared/"


# Sincronizar desde PC Linux a Raspberry Pi
#rsync -avz "$ruta_documentos" lucas@192.168.100.77:"$ruta_raspberry"
#rsync -avz "$ruta_projects" lucas@192.168.100.77:"$ruta_raspberry"
#rsync -avz "$ruta_imagenes" lucas@192.168.100.77:"$ruta_raspberry"
#rsync -avz "$ruta_bin" lucas@192.168.100.77:"$ruta_raspberry"
#rsync -avz "$ruta_descargas" lucas@192.168.100.77:"$ruta_raspberry"
rsync -avz "$ruta_lucas" lucas@192.168.100.77:"$ruta_raspberry"
