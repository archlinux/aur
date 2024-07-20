#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/sunroof-flags.conf ]]; then
    SUNROOF_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/sunroof-flags.conf)"
fi

# Launch
exec electron31 /usr/lib/sunroof/app.asar $SUNROOF_USER_FLAGS "$@"
