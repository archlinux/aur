#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-origin-flags.conf"
if [[ -f $USER_FLAGS_FILE ]]; then
   USER_FLAGS="$(sed 's/#.*//' "$USER_FLAGS_FILE")"
fi

if [[ -z "${CHROME_USER_DATA_DIR}" ]]; then
    export CHROME_USER_DATA_DIR=~/.config/BraveSoftware/Brave-Origin
fi
exec "/opt/brave.com/brave-origin/brave-origin" "$USER_FLAGS" "$BRAVE_FLAGS" "$FLAG" "$@"
