#!/bin/bash

# This script will synchronize from my PC to the RASPBERRY server

local_path="/home/lucas"
raspberry_base_path="/home/lucas/smb/raspberry/shared"
sync_folder="lucas_rsync_arch"

raspberry_path="$raspberry_base_path/$sync_folder/"


# Check if destination folder exists, create it if it doesn't
if [ ! -d "$raspberry_path" ]; then
    echo "Destination folder does not exist. Creating it now..."
    mkdir -p "$raspberry_path"
    if [ $? -eq 0 ]; then
        echo "Destination folder created successfully."
    else
        echo "Failed to create destination folder. Exiting."
        exit 1
    fi
else
    echo "Destination folder exists."
fi



rsync -av --progress "$local_path" "$raspberry_path"

