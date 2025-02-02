#!/bin/bash
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

if [[ -f $XDG_CONFIG_HOME/aide-flags.conf ]]; then
    readarray -t lines <"$XDG_CONFIG_HOME/aide-flags.conf"
    for line in "${lines[@]}"; do
        if ! [[ "$line" =~ ^[[:space:]]*# ]]; then
           CODE_USER_FLAGS+=($line)
        fi
    done
fi

exec /opt/aide/bin/aide "$@" "${CODE_USER_FLAGS[@]}"
