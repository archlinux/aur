#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

CODE_USER_FLAGS=()
# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/codium-flags.conf ]]; then
    CFG=$(cat "$XDG_CONFIG_HOME/codium-flags.conf")
    for val in $CFG; do
        CODE_USER_FLAGS+=("$val")
    done
fi

# Launch
exec /opt/vscodium-bin/bin/codium "$@" "${CODE_USER_FLAGS[@]}"
