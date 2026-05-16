#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

if [[ -f "${XDG_CONFIG_HOME}/trae-flags.conf" ]]; then
    mapfile -t TRAE_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/trae-flags.conf")"
fi

exec /opt/trae/trae "${TRAE_USER_FLAGS[@]}" "$@"
