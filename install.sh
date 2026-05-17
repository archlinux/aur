#!/bin/bash

# FastFlowLM-gtk Installation Script
# Run with sudo: sudo ./install.sh

if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root (sudo)"
  exit
fi

echo "Installing system dependencies..."
pacman -S --noconfirm fastflowlm python python-gobject gtk4 libadwaita libsoup3 gtksourceview5

echo "Installing FastFlowLM-gtk files..."

# Check if required files exist
REQUIRED_FILES=("flm-gtk" "flm-gtk.png" "flm-gtk.desktop")
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "Error: $file not found in current directory."
        exit 1
    fi
done

# Install files
cp flm-gtk /usr/bin/flm-gtk
chmod +x /usr/bin/flm-gtk

cp flm-gtk.png /usr/share/pixmaps/flm-gtk.png
cp flm-gtk.desktop /usr/share/applications/flm-gtk.desktop

# Update Desktop Database
update-desktop-database

echo "Installation complete! You can now launch 'FastFlowLM-gtk' from your app menu."
