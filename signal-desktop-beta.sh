#!/usr/bin/env bash

SIGNAL_USER_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/signal-desktop-beta-flags.conf"

# Allow users to override command-line options
if [[ -f "${SIGNAL_USER_FLAGS_FILE}" ]]; then
   SIGNAL_USER_FLAGS="$(sed 's/#.*//' "${SIGNAL_USER_FLAGS_FILE}" | tr '\n' ' ')"
fi

# Launch
exec /usr/lib/signal-desktop-beta/signal-desktop-beta $SIGNAL_USER_FLAGS "$@"
