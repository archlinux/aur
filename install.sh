#!/bin/bash

set -e

# Paths
INSTALL_DIR="$HOME/Basteh"
BIN_PATH="$HOME/.local/bin"
ICON_PATH="$HOME/.local/icons"
DESKTOP_PATH="$HOME/.local/share/applications"

# URLs
SOURCE_URL="https://raw.githubusercontent.com/sahandlinux/basteh/main/Basteh/main.c"
ICON_URL="https://raw.githubusercontent.com/sahandlinux/basteh/main/icons/basteh_minimal.jpg"

# Filenames
MAIN_C="$INSTALL_DIR/main.c"
BINARY="$INSTALL_DIR/basteh"

echo "Creating install directory: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

echo "Downloading main.c from GitHub..."
curl -sL "$SOURCE_URL" -o "$MAIN_C"

echo "Compiling Basteh..."
gcc "$MAIN_C" -o "$BINARY" `pkg-config --cflags --libs gtk+-3.0`

echo "Copying binary to $BIN_PATH"
mkdir -p "$BIN_PATH"
cp "$BINARY" "$BIN_PATH/basteh"
chmod +x "$BIN_PATH/basteh"

echo "Downloading icon..."
mkdir -p "$ICON_PATH"
curl -sL "$ICON_URL" -o "$ICON_PATH/basteh_minimal.jpg"

echo "🖥️ Creating .desktop launcher..."
mkdir -p "$DESKTOP_PATH"
cat > "$DESKTOP_PATH/basteh.desktop" <<EOF
[Desktop Entry]
Version=0.0.2
Name=Basteh
Exec=$BIN_PATH/basteh
Icon=$ICON_PATH/basteh_minimal.jpg
Terminal=false
Type=Application
Categories=System;Utility;
EOF

echo "Installation complete!"
echo "Basteh installed in: $INSTALL_DIR"
echo "You can now run it from the terminal (type: basteh) or your app launcher."

# Optional: update desktop database (usually handled automatically)
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$DESKTOP_PATH"
fi