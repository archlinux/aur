#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/cortexide-flags.conf ]]; then
    CORTEXIDE_USER_FLAGS="$(sed 's/#.*//' "$XDG_CONFIG_HOME/cortexide-flags.conf" | tr '\n' ' ')"
fi

# Launch
exec /opt/cortexide/bin/cortexide "$@" $CORTEXIDE_USER_FLAGS
