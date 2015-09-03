#!/bin/bash

# Allow users to override command-line options
if [[ -f ~/.config/liri-flags.conf ]]; then
  LIRI_USER_FLAGS="$(cat ~/.config/liri-flags.conf)"
fi

# Launch
exec /opt/material-browser/bin/material-browser $LIRI_USER_FLAGS $@
