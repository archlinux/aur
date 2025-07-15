#!/bin/bash

# Cursor launcher script
# This script allows loading user flags from $XDG_CONFIG_HOME/cursor-flags.conf

# Set default config directory according to XDG Base Directory Specification
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
CURSOR_FLAGS_FILE="$XDG_CONFIG_HOME/cursor-flags.conf"

# Default flags. Example: use --no-sandbox if the app doesn't start.
DEFAULT_FLAGS=()

# Create a default config file if it does not exist
if [[ ! -f "$CURSOR_FLAGS_FILE" ]]; then
    mkdir -p "$(dirname "$CURSOR_FLAGS_FILE")"
    # Provide a helpful default file
    cat > "$CURSOR_FLAGS_FILE" <<EOF
# User flags for Cursor. One flag per line.
# Example:
# --force-device-scale-factor=1.5
# --enable-features=UseOzonePlatform
# --ozone-platform=wayland
EOF
fi

# Read user flags into an array for safer handling
# This avoids issues with spaces and special characters.
USER_FLAGS=()
# The `while` loop is safer than `mapfile` or `xargs` for arbitrary flags.
while IFS= read -r line; do
    # Skip comments and empty lines
    if [[ "$line" =~ ^\s*# || -z "$line" ]]; then
        continue
    fi
    USER_FLAGS+=("$line")
done < "$CURSOR_FLAGS_FILE"


# Launch with AppImageLauncher disabled and execute Cursor AppImage
# exec replaces this script's process with the app's process.
# "$@" passes all command-line arguments from this script to the app.
APPIMAGELAUNCHER_DISABLE=TRUE exec /opt/cursor-app/cursor-app.AppImage "${DEFAULT_FLAGS[@]}" "${USER_FLAGS[@]}" "$@"