#!/bin/bash

# Allow users to override command-line options
# This is the standard mechanism for Electron apps on Arch Linux
# Usage: Add flags one per line to ~/.config/wavebox-flags.conf

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
WAVEBOX_USER_FLAGS_FILE="$XDG_CONFIG_HOME/wavebox-flags.conf"
WAVEBOX_FLAGS=""

if [[ -f "$WAVEBOX_USER_FLAGS_FILE" ]]; then
    # Read flags from config file, ignoring comments and empty lines
    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip empty lines and comments
        [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
        # Append flag
        WAVEBOX_FLAGS="$WAVEBOX_FLAGS $line"
    done < "$WAVEBOX_USER_FLAGS_FILE"
fi

exec /opt/wavebox.io/wavebox/wavebox-launcher $WAVEBOX_FLAGS "$@"
