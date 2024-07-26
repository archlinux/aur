#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/xmind-flags.conf ]]; then
   XMIND_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/xmind-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/Xmind/xmind "$@" $XMIND_USER_FLAGS