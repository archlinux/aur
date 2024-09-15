#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/tosu-flags.conf ]]; then
   TOSU_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/tosu-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/tosu/tosu "$@" $TOSU_USER_FLAGS
