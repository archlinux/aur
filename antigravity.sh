#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/antigravity-flags.conf ]]; then
    ANTIGRAVITY_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/antigravity-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/Antigravity/antigravity "$@" $ANTIGRAVITY_USER_FLAGS

