#!/bin/bash

# Allow users to override command-line options
if [[ -f ~/.config/chrome-beta-flags.conf ]]; then
   CHROME_USER_FLAGS="$(cat ~/.config/chrome-beta-flags.conf)"
fi

# Launch
exec /opt/google/chrome-beta/google-chrome-beta $CHROME_USER_FLAGS "$@"