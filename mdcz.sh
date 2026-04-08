#!/bin/bash

MDCZ_USER_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/mdcz/user-flags.conf"

# Allow users to override command-line options
if [[ -f "${MDCZ_USER_FLAGS_FILE}" ]]; then
   MDCZ_USER_FLAGS=$(grep -v '^#' "$MDCZ_USER_FLAGS_FILE")
fi

# Launch
exec electron39 /usr/lib/mdcz/app.asar $MDCZ_USER_FLAGS "$@"
