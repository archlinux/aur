#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/chrome-canary-flags.conf ]]; then
    CHROME_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/chrome-canary-flags.conf)"
fi

# Launch
exec /opt/google/chrome-canary/google-chrome-canary $CHROME_USER_FLAGS "$@"
