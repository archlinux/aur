#!/bin/bash

# Cursor launcher script
# This script allows loading user flags from $XDG_CONFIG_HOME/cursor-flags.conf

# Set default config directory
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
CURSOR_FLAGS_FILE="$XDG_CONFIG_HOME/cursor-flags.conf"

# Default flags
DEFAULT_FLAGS=""

# Создать файл с дефолтным содержимым, если он отсутствует
if [[ ! -f "$CURSOR_FLAGS_FILE" ]]; then
    mkdir -p "$(dirname "$CURSOR_FLAGS_FILE")"
    echo "# Пользовательские флаги для Cursor" > "$CURSOR_FLAGS_FILE"
fi

# Read user flags if file exists
USER_FLAGS=""
if [[ -f "$CURSOR_FLAGS_FILE" ]]; then
    USER_FLAGS=$(cat "$CURSOR_FLAGS_FILE")
fi

# Combine flags
ALL_FLAGS="$DEFAULT_FLAGS $USER_FLAGS"

# Execute Cursor AppImage with flags and passed arguments
exec /opt/cursor-app/cursor-app.AppImage $ALL_FLAGS "$@"

# Launch with AppImageLauncher disabled only for this process (author panikinator https://github.com/Gunther-Schulz/aur-cursor-bin-updater/pull/15/commits/1d44207003a7c1ebf16719135c8d03856e109e5f)
APPIMAGELAUNCHER_DISABLE=TRUE exec /opt/cursor-app/cursor-app.AppImage"$@" $CURSOR_USER_FLAGS