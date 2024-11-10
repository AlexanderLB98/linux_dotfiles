#!/bin/bash

# Directorio donde se almacenarán las instantáneas
TIMESIFT_DIR="/mnt/Corsair-drive-1/timeshift-home"

# Asegúrate de que el directorio exista
if [ ! -d "$TIMESIFT_DIR" ]; then
    echo "El directorio $TIMESIFT_DIR no existe. Creando directorio..."
    sudo mkdir -p "$TIMESIFT_DIR"
fi

# Configuración para Timeshift (en este caso, rsync como tipo de instantánea)
# Cambia el dispositivo de snapshot si lo necesitas (por ejemplo, /dev/sdXY)
SNAPSHOT_DEVICE="/dev/nvme0n1p4"  

# Crear la instantánea en la ubicación definida
sudo timeshift --create --comments "Snapshot $(date)" --snapshot-device "$SNAPSHOT_DEVICE" --destination "$TIMESIFT_DIR"

# Verifica si el snapshot se ha creado exitosamente
if [ $? -eq 0 ]; then
    echo "La instantánea se ha creado correctamente en $TIMESIFT_DIR"
else
    echo "Hubo un error al crear la instantánea."
fi

