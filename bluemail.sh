#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/bluemail-flags.conf ]]; then
   BLUEMAIL_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/bluemail-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/bluemail/bluemail $BLUEMAIL_USER_FLAGS "$@"
