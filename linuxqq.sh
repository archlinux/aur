#!/bin/bash

if [ -d "$HOME/.config/QQ/crash_files" ] && [ ! -L "$HOME/.config/QQ/crash_files" ]; then
    rm -rf "$HOME/.config/QQ/crash_files"/*
fi

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

if [[ -f "${XDG_CONFIG_HOME}/qq-flags.conf" ]]; then
    mapfile -t QQ_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/qq-flags.conf")"
fi

exec /opt/QQ/qq "${QQ_USER_FLAGS[@]}" "$@"
