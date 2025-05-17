#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/chromium-flags.conf ]]; then
    CHROME_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/chromium-flags.conf)"
fi

# Launch
exec /opt/chromium.org/chromium-unstable/chromium-browser-unstable $CHROME_USER_FLAGS "$@"
