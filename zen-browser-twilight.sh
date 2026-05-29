#!/usr/bin/env bash

# Enable strict bash rules for easier debugging and security.
set -u

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
FLAGS_FILE="${XDG_CONFIG_HOME}/zen-browser-twilight-flags.conf"

export MOZ_APP_LAUNCHER="/usr/bin/zen-browser-twilight"

declare -a ZEN_USER_FLAGS=()

# Safely load user flags
if [[ -f "$FLAGS_FILE" ]]; then
    while read -r line || [[ -n "$line" ]]; do
        trimmed="${line#"${line%%[![:space:]]*}"}"
        trimmed="${trimmed%"${trimmed##*[![:space:]]}"}"

        if [[ -n "$trimmed" && ! "$trimmed" =~ ^# ]]; then
            ZEN_USER_FLAGS+=("$trimmed")
        fi
    done < "$FLAGS_FILE"
fi

# Launch the browser with the passed arguments
exec /opt/zen-browser-twilight-bin/zen-bin "${ZEN_USER_FLAGS[@]}" "$@"
