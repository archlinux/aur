#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [ -f "$XDG_CONFIG_HOME/vesktop-flags.conf" ]; then
    VESKTOP_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/vesktop-flags.conf")"
fi

# Launch (each word in VESKTOP_USER_FLAGS must be split)
# shellcheck disable=SC2086
exec /usr/lib/vesktop/vesktop $VESKTOP_USER_FLAGS "$@"
