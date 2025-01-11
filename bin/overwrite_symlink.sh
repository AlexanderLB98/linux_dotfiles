#!/bin/bash

# Eliminar directorios existentes dentro de ~/.config
for folder in ~/github/linux_dotfiles/*; do
  if [ -d "$folder" ]; then
    folder_name=$(basename "$folder")
    rm -rf ~/.config/$folder_name
    ln -s "$folder" ~/.config/
  fi
done

echo "Enlaces simbólicos creados correctamente."

