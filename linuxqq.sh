#!/usr/bin/env bash

set -u

if [ -d "$HOME/.config/QQ/crash_files" ] && [ ! -L "$HOME/.config/QQ/crash_files" ]; then
    rm -rf "$HOME/.config/QQ/crash_files"/*
fi

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
FLAGS_FILE="${XDG_CONFIG_HOME}/qq-flags.conf"

declare -a QQ_USER_FLAGS=()

# Safely load user flags
if [[ -f "$FLAGS_FILE" ]]; then
    while read -r line || [[ -n "$line" ]]; do
        trimmed="${line#"${line%%[![:space:]]*}"}"
        trimmed="${trimmed%"${trimmed##*[![:space:]]}"}"

        if [[ -n "$trimmed" && ! "$trimmed" =~ ^# ]]; then
            QQ_USER_FLAGS+=("$trimmed")
        fi
    done < "$FLAGS_FILE"
fi

exec /opt/QQ/qq "${QQ_USER_FLAGS[@]}" "$@"
