#!/bin/bash

# Cursor launcher script
# This script allows loading user flags from $XDG_CONFIG_HOME/cursor-flags.conf

# Set default config directory
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
CURSOR_FLAGS_FILE="$XDG_CONFIG_HOME/cursor-flags.conf"

# Default flags
DEFAULT_FLAGS="--no-sandbox"

# Read user flags if file exists
USER_FLAGS=""
if [[ -f "$CURSOR_FLAGS_FILE" ]]; then
    USER_FLAGS=$(cat "$CURSOR_FLAGS_FILE")
fi

# Combine flags
ALL_FLAGS="$DEFAULT_FLAGS $USER_FLAGS"

# Execute Cursor AppImage with flags and passed arguments
exec /opt/cursor-app/cursor-app.AppImage $ALL_FLAGS "$@"