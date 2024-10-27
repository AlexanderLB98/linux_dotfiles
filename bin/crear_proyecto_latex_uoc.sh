#!/bin/bash

# Pedir al usuario el nombre de la carpeta
read -p "Introduce el nombre del nuevo proyecto: " folder_name

# Definir la ruta de la nueva carpeta
new_folder="$HOME/Documents/latex/$folder_name"

# Crear la carpeta
mkdir -p "$new_folder"

# Copiar el contenido de la plantilla
cp -r "$HOME/Documents/latex/plantilla_latex_uoc/"* "$new_folder"

# Mensaje de éxito
echo "La carpeta '$folder_name' ha sido creada en '$new_folder' y se ha copiado el contenido de 'plantilla_latex_uoc'."

# Cambiar a la nueva carpeta
cd "$new_folder" || exit

# Mensaje de cambio de directorio
echo "Ahora estás en: $(pwd)"
