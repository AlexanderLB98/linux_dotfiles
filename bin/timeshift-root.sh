#!/bin/bash

# Directorio donde se almacenarán las instantáneas
TIMESIFT_DIR="/mnt/Corsair-drive-1/timeshift-root"

# Asegúrate de que el directorio exista
if [ ! -d "$TIMESIFT_DIR" ]; then
    echo "El directorio $TIMESIFT_DIR no existe. Creando directorio..."
    sudo mkdir -p "$TIMESIFT_DIR"
fi

# El dispositivo donde está montado el directorio (en este caso, /dev/sdb1 es el dispositivo)
BACKUP_DEVICE="/dev/sdb5"

# Configuración para Timeshift (en este caso, rsync como tipo de instantánea)
SNAPSHOT_DEVICE="/dev/nvme0n1p3"  

# Asegúrate de que el dispositivo esté montado antes de intentar crear la instantánea
if ! mount | grep "$BACKUP_DEVICE" > /dev/null; then
    echo "El dispositivo $BACKUP_DEVICE no está montado. Montándolo..."
    sudo mount "$BACKUP_DEVICE" "$TIMESIFT_DIR"
fi

# Crear la instantánea en la ubicación definida
sudo timeshift --create --comments "Snapshot $(date)" --snapshot-device "$SNAPSHOT_DEVICE" --backup-device "$BACKUP_DEVICE" --rsync

# Verifica si el snapshot se ha creado exitosamente
if [ $? -eq 0 ]; then
    echo "La instantánea se ha creado correctamente en $TIMESIFT_DIR"
else
    echo "Hubo un error al crear la instantánea."
fi

