#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/cursor-flags.conf ]]; then
  CURSOR_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/cursor-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/cursor-bin/cursor-bin.AppImage "$@" $CURSOR_USER_FLAGS
