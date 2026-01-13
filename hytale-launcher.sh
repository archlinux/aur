#!/bin/bash
# ==============================================================================
# Hytale Launcher Wrapper for Arch Linux
#
# Author:      [SCDevel/root@scdevel.net]
# License:     MIT
# Description: Handles custom directory installation and environment variables for the Hytale Launcher.
#
# Disclaimer:  This script is an unofficial community tool and is not
#              affiliated with, endorsed by, or owned by Hypixel Studios Canada.
# ==============================================================================

# NVIDIA Sync Fix
export __NV_DISABLE_EXPLICIT_SYNC=1

# Webkit Rendering Fix
export WEBKIT_DISABLE_DMABUF_RENDERER=1

export DESKTOP_STARTUP_ID=com.hypixel.HytaleLauncher

# CONSTANTS
DEFAULT_DIR="$HOME/.local/share/Hytale/install/release/package/launcher/current"
LAUNCHER_DIR="$DEFAULT_DIR"
SOURCE_DIR="/opt/hytale-launcher-bin"
BIN_NAME="hytale-launcher"



# 2. Handle Command Line Arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--directory) LAUNCHER_DIR="$2"; shift ;;
        -h|--help)
            echo "Usage: hytale-launcher [options]"
            echo "Options:"
            echo "  -d, --directory PATH    Specify a custom installation directory"
            echo "  -h, --help              Show this help message"
            exit 0
            ;;
    esac
    shift
done

# If the launcher isn't in the user's home yet, copy the files
if [ ! -d "$LAUNCHER_DIR" ]; then
    echo "Installing Hytale Launcher to $LAUNCHER_DIR..."
    mkdir -p "$LAUNCHER_DIR"
    cp -r "$SOURCE_DIR/$BIN_NAME" "$LAUNCHER_DIR/$BIN_NAME"
fi

# Switch to the directory and run it
cd "$LAUNCHER_DIR"


if [ "$1" == "--debug" ]; then
    "./$BIN_NAME" "$@" 2>&1 | "$SOURCE_DIR/hytale-debug.sh" "$@"
else
    exec "./$BIN_NAME" "$@" "$@"
fi
