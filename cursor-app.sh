#!/bin/bash

# Cursor launcher script
# This script allows loading user flags from $XDG_CONFIG_HOME/cursor-flags.conf

# Set default config directory
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
CURSOR_FLAGS_FILE="$XDG_CONFIG_HOME/cursor-flags.conf"

# Default flags if doesn't start use --no-sandbox
DEFAULT_FLAGS=""

# Create a file with default contents if it does not exist
if [[ ! -f "$CURSOR_FLAGS_FILE" ]]; then
    mkdir -p "$(dirname "$CURSOR_FLAGS_FILE")"
    echo "# User flags for Cursor" > "$CURSOR_FLAGS_FILE"
fi

# Read user flags if file exists
USER_FLAGS=""
if [[ -f "$CURSOR_FLAGS_FILE" ]]; then
    # Filter only valid flags: remove comments and empty lines
    USER_FLAGS=$(grep -vE '^\s*#' "$CURSOR_FLAGS_FILE" | grep -vE '^\s*$' | xargs)
fi

# Combine flags
ALL_FLAGS="$DEFAULT_FLAGS $USER_FLAGS"

# Launch with AppImageLauncher disabled and execute Cursor AppImage
APPIMAGELAUNCHER_DISABLE=TRUE exec /opt/cursor-app/cursor-app.AppImage $ALL_FLAGS "$@"