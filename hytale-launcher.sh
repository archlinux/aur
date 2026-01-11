#!/bin/bash

# NVIDIA Sync Fix
export __NV_DISABLE_EXPLICIT_SYNC=1

# Webkit Rendering Fix
export WEBKIT_DISABLE_DMABUF_RENDERER=1

export DESKTOP_STARTUP_ID=hytale-launcher

# CONSTANTS
LAUNCHER_DIR="$HOME/.local/share/Hytale/install/release/package/launcher/current"
SOURCE_DIR="/opt/hytale-launcher-bin"
LAUNCHER_BIN="hytale-launcher"

# If the launcher isn't in the user's home yet, copy the files
if [ ! -d "$LAUNCHER_DIR" ]; then
    echo "Installing Hytale Launcher to $LAUNCHER_DIR..."
    mkdir -p "$LAUNCHER_DIR"
    cp -r "$SOURCE_DIR/$LAUNCHER_BIN" "$LAUNCHER_DIR/$LAUNCHER_BIN"
fi

# Switch to the directory and run it
cd "$LAUNCHER_DIR"
exec ./$LAUNCHER_BIN "$@"
