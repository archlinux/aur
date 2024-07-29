#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/equibop-flags.conf ]]; then
    EQUIBOP_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/equibop-flags.conf)"
fi

# Launch
exec electron31 /usr/lib/equibop/app.asar $EQUIBOP_USER_FLAGS "$@"
