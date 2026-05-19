#!/bin/bash

# FastFlowLM-gtk Manual Installation Script
# This script mirrors the AUR PKGBUILD installation logic.
# Run with sudo: sudo ./install.sh

if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root (sudo)"
  exit
fi

echo "Installing system dependencies..."
pacman -S --noconfirm fastflowlm python python-gobject gtk4 libadwaita libsoup3 gtksourceview5 python-psutil

echo "Installing FastFlowLM-gtk files..."

INSTALL_DIR="/usr/share/fastflowlm-gtk"
BIN_DIR="/usr/bin"
ICON_DIR="/usr/share/icons/hicolor/256x256/apps"
APP_DIR="/usr/share/applications"

# Create directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$ICON_DIR"
mkdir -p "$APP_DIR"

# Install Python files
cp app.py main.py flm.py utils.py "$INSTALL_DIR/"
chmod 644 "$INSTALL_DIR"/*.py

# Install Icon
cp flm-gtk.png "$ICON_DIR/fastflowlm-gtk.png"
chmod 644 "$ICON_DIR/fastflowlm-gtk.png"

# Install Desktop file
cp fastflowlm-gtk.desktop "$APP_DIR/fastflowlm-gtk.desktop"
chmod 644 "$APP_DIR/fastflowlm-gtk.desktop"

# Create executable wrapper
cat <<EOF > "$BIN_DIR/fastflowlm-gtk"
#!/bin/sh
export PYTHONPATH="$INSTALL_DIR:\$PYTHONPATH"
exec python $INSTALL_DIR/app.py "\$@"
EOF
chmod 755 "$BIN_DIR/fastflowlm-gtk"

# Update Desktop/Icon Database
update-desktop-database -q
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

echo "Installation complete! You can now launch 'FastFlowLM-gtk' from your app menu."
