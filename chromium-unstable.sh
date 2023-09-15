#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Separate chromium-browser-unstable's WM_CLASS and user data directory from chromium.
# Flags can be overwritten with user flags and command-line arguments.
CHROMIUM_UNSTABLE_FLAGS="
--class=Chromium-unstable
--user-data-dir=$XDG_CONFIG_HOME/chromium-unstable
"

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/chromium-unstable-flags.conf ]]; then
    CHROMIUM_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/chromium-unstable-flags.conf)"
fi

# Launch
exec /opt/chromium.org/chromium-unstable/chromium-browser-unstable $CHROMIUM_UNSTABLE_FLAGS $CHROMIUM_USER_FLAGS "$@"
