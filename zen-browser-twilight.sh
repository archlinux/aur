#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

export MOZ_APP_LAUNCHER=/usr/bin/zen-browser-twilight

if [[ -f "${XDG_CONFIG_HOME}/zen-browser-twilight-flags.conf" ]]; then
    mapfile -t ZEN_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/zen-browser-twilight-flags.conf")"
fi

exec /opt/zen-browser-twilight-bin/zen-bin "${ZEN_USER_FLAGS[@]}" "$@"
