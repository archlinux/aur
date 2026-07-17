#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [ -f "$XDG_CONFIG_HOME/pd2mm-flags.conf" ]; then
    PD2MM_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/pd2mm-flags.conf")"
fi

# Launch (each word in PD2MM_USER_FLAGS must be split)
# shellcheck disable=SC2086
exec /usr/lib/pd2mm/pd2mm $PD2MM_USER_FLAGS "$@"