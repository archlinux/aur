#!/bin/bash

# FastFlowLM-gtk Uninstallation Script
# Run with sudo: sudo ./uninstall.sh

if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root (sudo)"
  exit
fi

echo "Uninstalling FastFlowLM-gtk..."

INSTALL_DIR="/usr/share/fastflowlm-gtk"
BIN_PATH="/usr/bin/fastflowlm-gtk"
ICON_PATH="/usr/share/icons/hicolor/256x256/apps/com.marley.FastFlowLM-gtk.png"
DESKTOP_PATH="/usr/share/applications/com.marley.FastFlowLM-gtk.desktop"

# Remove files
rm -f "$BIN_PATH"
rm -rf "$INSTALL_DIR"
rm -f "$ICON_PATH"
rm -f "$DESKTOP_PATH"

# Update Desktop/Icon Database
update-desktop-database -q
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

echo "Uninstallation complete!"
read -p "Press enter to exit..."
