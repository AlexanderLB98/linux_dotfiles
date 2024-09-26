#!/bin/bash

raspberry_ip="192.168.100.77"
smb_share="raspberrypihdd"
mount_point="/mnt/raspberry"
cred_file="/home/lucas/.config_creds"

# Ensure the mount point exists
if [ ! -d "$mount_point" ]; then
    sudo mkdir -p "$mount_point"
fi

# Check if credentials file exists
if [ ! -f "$cred_file" ]; then
    echo "Credentials file not found. Please create it at $cred_file"
    echo "Format should be:"
    echo "username=your_username"
    echo "smb_pw=your_password"
    exit 1
fi

# Read credentials from file
username=$(grep -oP '(?<=username=).+' "$cred_file")
password=$(grep -oP '(?<=smb_pw=).+' "$cred_file")

if [ -z "$username" ] || [ -z "$password" ]; then
    echo "Failed to read credentials from $cred_file"
    exit 1
fi

# Mount the SMB share
echo "Mounting SMB share..."
#sudo mount -t cifs //$raspberry_ip/$smb_share "$mount_point" -o username="$username",password="$password",uid=$(id -u),gid=$(id -g),iocharset=utf8,file_mode=0777,dir_mode=0777
sudo mount -t cifs //192.168.100.77/raspberrypihdd/ /home/lucas/smb -o username="$username",password="$password"

if [ $? -ne 0 ]; then
    echo "Failed to mount SMB share. Exiting."
    exit 1
fi

echo "SMB share mounted successfully."
