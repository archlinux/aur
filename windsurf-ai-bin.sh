#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/windsurf-ai-flags.conf ]]; then
    readarray lines <"$XDG_CONFIG_HOME/windsurf-ai-flags.conf"
    for line in "${lines[@]}"; do
        if ! [[ "$line" =~ ^[[:space:]]*# ]]; then
           WINDSURF_USER_FLAGS+=($line)
        fi
    done
fi

# Launch Windsurf-AI
exec /opt/Windsurf-AI/Windsurf/windsurf "$@" "${WINDSURF_USER_FLAGS[@]}"
