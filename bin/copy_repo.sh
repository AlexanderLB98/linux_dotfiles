#!/bin/bash

# Ruta a tu repositorio
REPO_PATH="/home/lucas/github/linux_dotfiles/"

# Directorio de configuración
CONFIG_PATH="$HOME/.config"

# Copiar los archivos
cp -r $REPO_PATH/* $CONFIG_PATH/

echo "Archivos copiados correctamente."

