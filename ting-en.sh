#!/usr/bin/env bash
#
# Launcher script for eusoft-ting-en (每日英语听力)
# Provides native Wayland auto-detection and user flags loading.
#

set -e

TING_BIN="/opt/每日英语听力/ting_en"

FLAGS=()

# 1. Environment & Platform Auto-detection
if [[ -n "${WAYLAND_DISPLAY}" && -S "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}" ]]; then
    FLAGS+=(
        "--ozone-platform-hint=auto"
        "--enable-features=WaylandWindowDecorations"
    )
fi

# 2. Load User Custom Flags if available (~/.config/ting-en-flags.conf)
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
if [[ -f "${XDG_CONFIG_HOME}/ting-en-flags.conf" ]]; then
    while IFS= read -r line || [[ -n "$line" ]]; do
        line="$(echo "$line" | sed 's/#.*//;s/^[[:space:]]*//;s/[[:space:]]*$//')"
        [[ -n "$line" ]] && FLAGS+=("$line")
    done < "${XDG_CONFIG_HOME}/ting-en-flags.conf"
fi

exec "${TING_BIN}" "${FLAGS[@]}" "$@"
