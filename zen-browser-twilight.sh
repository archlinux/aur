#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

if [[ -f "${XDG_CONFIG_HOME}/zen-browser-twilight-flags.conf" ]]; then
    mapfile -t ZEN_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/zen-browser-twilight-flags.conf")"
fi

exec /opt/zen-browser-twilight-bin/zen-bin "${ZEN_USER_FLAGS[@]}" "$@"
