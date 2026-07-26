#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [ -f "$XDG_CONFIG_HOME/sable-flags.conf" ]; then
    SABLE_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/sable-flags.conf")"
fi

# Launch (each word in SABLE_USER_FLAGS must be split)
# shellcheck disable=SC2086
exec /usr/lib/sable-electron/sable-electron $SABLE_USER_FLAGS "$@"
