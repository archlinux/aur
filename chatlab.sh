#!/bin/bash

CHATLAB_USER_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/chatlab/user-flags.conf"

# Allow users to override command-line options
if [[ -f "${CHATLAB_USER_FLAGS_FILE}" ]]; then
   CHATLAB_USER_FLAGS=$(grep -v '^#' "$CHATLAB_USER_FLAGS_FILE")
fi

# Launch
exec electron35 /usr/lib/chatlab/app.asar $CHATLAB_USER_FLAGS "$@"
