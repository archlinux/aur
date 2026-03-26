#!/bin/bash

# --- Welcome to yt setup bash!

# --- Config and Paths ---
CONFIG_SRC="yt.cfg"
PAM_SRC="yt.pam"
BIN_SRC="yt"

CONFIG_DEST="/etc/yt.cfg"
PAM_DEST="/etc/pam.d/yt"
BIN_DEST="/usr/local/bin/yt"

# --- Root Check ---
if [ "$EUID" -ne 0 ]; then
    echo "[yt] Error: This script must be run as root."
    exit 1
fi

echo "[yt] Starting installation..."

# 1. Install Binary
if [ -f "$BIN_SRC" ]; then
    cp "$BIN_SRC" "$BIN_DEST"
    chmod +x "$BIN_DEST"
    echo "[yt] Binary installed to: $BIN_DEST"
else
    echo "[yt] Error: Source binary '$BIN_SRC' not found!"
fi

# 2. Install PAM Service
if [ -f "$PAM_SRC" ]; then
    cp "$PAM_SRC" "$PAM_DEST"
    chmod 644 "$PAM_DEST"
    echo "[yt] PAM service installed to: $PAM_DEST"
fi

# 3. Handle Config File
if [ -f "$CONFIG_SRC" ]; then
    cp "$CONFIG_SRC" "$CONFIG_DEST"
else
    if [ ! -f "$CONFIG_DEST" ]; then
        touch "$CONFIG_DEST"
        echo "[yt] Created new config file."
    fi
fi

# 4. Set Permissions (Root: RW, Others: RO)
# 644 means: Root (Read/Write), Group/Others (Read Only)
chown root:root "$CONFIG_DEST"
chmod 644 "$CONFIG_DEST"

echo "[yt] Config permissions set: Root(RW), Others(RO)"
echo "[yt] Installation completed successfully."
