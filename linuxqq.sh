#!/bin/bash

if [ -d "$HOME/.config/QQ/versions" ]; then
    find "$HOME/.config/QQ/versions" -name sharp-lib -type d -exec rm -rf {} \; 2>/dev/null
    find "$HOME/.config/QQ/versions" -name libssh2.so.1 -type f -exec rm -f {} \; 2>/dev/null
fi

if [ -d "$HOME/.config/QQ/crash_files" ] && [ ! -L "$HOME/.config/QQ/crash_files" ]; then
    rm -rf "$HOME/.config/QQ/crash_files"/*
fi

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

if [[ -f "${XDG_CONFIG_HOME}/qq-flags.conf" ]]; then
    mapfile -t QQ_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/qq-flags.conf")"
fi

exec /opt/QQ/qq "${QQ_USER_FLAGS[@]}" "$@"
