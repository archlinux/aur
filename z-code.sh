#!/usr/bin/env bash

set -u

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
FLAGS_FILE="${XDG_CONFIG_HOME}/z-code-flags.conf"

declare -a ZCODE_USER_FLAGS=()

# Safely load user flags
if [[ -f "$FLAGS_FILE" ]]; then
    while read -r line || [[ -n "$line" ]]; do
        trimmed="${line#"${line%%[![:space:]]*}"}"
        trimmed="${trimmed%"${trimmed##*[![:space:]]}"}"

        if [[ -n "$trimmed" && ! "$trimmed" =~ ^# ]]; then
            ZCODE_USER_FLAGS+=("$trimmed")
        fi
    done < "$FLAGS_FILE"
fi

exec /opt/ZCode/zcode "${ZCODE_USER_FLAGS[@]}" "$@"
