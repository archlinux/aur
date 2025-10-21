#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [ -f "$XDG_CONFIG_HOME/cinny-flags.conf" ]; then
    CINNY_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/cinny-flags.conf")"
fi

# Launch (each word in CINNY_USER_FLAGS must be split)
# shellcheck disable=SC2086
exec /usr/lib/cinny-electron/cinny-electron $CINNY_USER_FLAGS "$@"
