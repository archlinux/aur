#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Detach chromium-unstable's WM_CLASS and user data directory from chromium.
# These flags can be overwritten with user flags and command-line options.
CHROMIUM_UNSTABLE_FLAGS="
--class=Chromium-unstable
--user-data-dir=$XDG_CONFIG_HOME/chromium-unstable
"

# Allow users to override command-line options
[ -f "${XDG_CONFIG_HOME}/chromium-unstable-flags.conf" ] && \
  CHROMIUM_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/chromium-unstable-flags.conf)"

# Launch
exec /opt/chromium.org/chromium-unstable/chromium-browser-unstable \
  $CHROMIUM_UNSTABLE_FLAGS $CHROMIUM_USER_FLAGS "$@"
