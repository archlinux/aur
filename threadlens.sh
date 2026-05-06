#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [ -f "$XDG_CONFIG_HOME/threadlens-flags.conf" ]; then
  THREADLENS_USER_FLAGS="$(sed 's/#.*//' "$XDG_CONFIG_HOME/threadlens-flags.conf" | tr '\n' ' ')"
fi

# Launch
exec /opt/threadlens-bin/ThreadLens-0.3.0.AppImage "$@" $THREADLENS_USER_FLAGS
