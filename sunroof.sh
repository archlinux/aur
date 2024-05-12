#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/sunroof-flags.conf ]]; then
    SUNROOF_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/sunroof-flags.conf)"
fi

# Launch
exec /usr/lib/sunroof/sunroof $SUNROOF_USER_FLAGS "$@"
