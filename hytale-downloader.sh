#!/bin/bash
# ==============================================================================
# Hytale Launcher Wrapper for Arch Linux
#
# Author:      [SCDevel/root@scdevel.net]
# License:     MIT
# Description: Wrapper script for the Hytale Downloader.
#
# Disclaimer:  This script is an unofficial community tool and is not
#              affiliated with, endorsed by, or owned by Hypixel Studios Canada.
# ==============================================================================

DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/Hytale"
DEFAULT_PATH="$DATA_DIR/.hytale-downloader-credentials.json"

mkdir -p "$DATA_DIR"

USER_PROVIDED_PATH=false
for arg in "$@"; do
    if [[ "$arg" == "-credentials-path" ]]; then
        USER_PROVIDED_PATH=true
        break
    fi
done

if [ "$USER_PROVIDED_PATH" = true ]; then
    exec /opt/hytale-downloader-bin/hytale-downloader "$@"
else
    echo "No credentials path provided. Using default path: $DEFAULT_PATH"
    exec /opt/hytale-downloader-bin/hytale-downloader "$@" -credentials-path "$DEFAULT_PATH"
fi
