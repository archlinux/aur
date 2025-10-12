#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
if [[ -f "$XDG_CONFIG_HOME/pear-flags.conf" ]]; then
   PEAR_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/pear-flags.conf")"
fi

# Launch
export ELECTRON_IS_DEV=0
exec electron@ELECTRONVERSION@ /usr/lib/pear-desktop/app.asar $PEAR_USER_FLAGS "$@"
