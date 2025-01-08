#!/bin/bash

# Función recursiva para renombrar directorios "~"
rename_tilde_directories() {
    local dir="$1"

    # Buscar todas las carpetas llamadas "~" en el directorio actual
    find "$dir" -type d -name "~" | while read tilde_dir; do
        # Verificar si el directorio existe y es válido
        if [[ -d "$tilde_dir" ]]; then
            # Generar un nuevo nombre para la carpeta
            new_dir="${tilde_dir%/*}/mi_carpeta_$(date +%s%N | cut -c1-13)"
            echo "Renombrando: $tilde_dir -> $new_dir"
            mv "$tilde_dir" "$new_dir"
            
            # Llamar a la función recursivamente para el nuevo directorio renombrado
            rename_tilde_directories "$new_dir"
        fi
    done
}

# Comprobar si se pasó un argumento (directorio a buscar)
if [ -z "$1" ]; then
    echo "Por favor, especifica el directorio donde buscar."
    echo "Uso: $0 /ruta/del/directorio"
    exit 1
fi

# Llamar a la función inicial
rename_tilde_directories "$1"

