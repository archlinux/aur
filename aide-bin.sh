#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/aide-flags.conf ]]; then
   CODE_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/aide-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/aide/bin/aide "$@" $CODE_USER_FLAGS
