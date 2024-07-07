#!/bin/bash

# Base origin and destination directories
ORIGIN_BASE="$HOME/.config"
DEST_BASE="$HOME/github/linux_dotfiles"

# Define list of folders to copy (without the full path)
folders_to_copy=(
    waybar
    hypr
    kitty
    neofetch
)

echo "Starting folder copy process..."

# Iterate over each folder in the list and copy it
for folder in "${folders_to_copy[@]}"; do
    ORIGIN_DIR="$ORIGIN_BASE/$folder"
    DEST_DIR="$DEST_BASE/$folder"
    if [ -d "$ORIGIN_DIR" ]; then
        echo "Copying folder '$folder' from '$ORIGIN_DIR' to '$DEST_DIR'"
        mkdir -p "$DEST_DIR"
        cp -rv "$ORIGIN_DIR"/* "$DEST_DIR"
        echo "Folder '$folder' copied successfully."
    else
        echo "Warning: Folder '$folder' not found in '$ORIGIN_BASE'. Not copied."
    fi
done


echo "Starting copy process of ~/bin folder..."

#BIN_DEST="$DEST_BASE/bin"
echo "$DEST_BASE/bin/"
# Create the destination directory if it doesn't exist
mkdir -p "$DEST_BASE/bin"
# Copy the entire bin folder
cp -rv ~/bin/ "$DEST_BASE/"
echo "Copy process completed."
