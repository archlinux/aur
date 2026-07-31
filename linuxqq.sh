#!/usr/bin/env bash

set -u

CRASH_DIR="$HOME/.config/QQ/crash_files"

if [[ -d "$CRASH_DIR" && ! -L "$CRASH_DIR" ]]; then
    rm -rf -- "$CRASH_DIR"/*
fi

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
FLAGS_FILE="${XDG_CONFIG_HOME}/qq-flags.conf"

declare -a QQ_DEFAULT_FLAGS=()
declare -a QQ_USER_FLAGS=()

# Use native Wayland when running in a Wayland session.
if [[ "${XDG_SESSION_TYPE:-}" == "wayland" ]] || [[ -n "${WAYLAND_DISPLAY:-}" ]]; then
    QQ_DEFAULT_FLAGS+=(--ozone-platform=wayland)
fi

# Safely load user flags.
if [[ -f "$FLAGS_FILE" ]]; then
    while IFS= read -r line || [[ -n "$line" ]]; do
        # Trim leading whitespace.
        trimmed="${line#"${line%%[![:space:]]*}"}"
        # Trim trailing whitespace.
        trimmed="${trimmed%"${trimmed##*[![:space:]]}"}"

        # Ignore empty lines and comments.
        if [[ -n "$trimmed" && ! "$trimmed" =~ ^# ]]; then
            QQ_USER_FLAGS+=("$trimmed")
        fi
    done < "$FLAGS_FILE"
fi

exec /opt/QQ/qq \
    "${QQ_DEFAULT_FLAGS[@]}" \
    "${QQ_USER_FLAGS[@]}" \
    "$@"