#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-nightly-flags.conf"
if [[ -f $USER_FLAGS_FILE ]]; then
   USER_FLAGS="$(cat $USER_FLAGS_FILE | sed 's/#.*//')"
fi

if [[ -z "${CHROME_USER_DATA_DIR}" ]]; then
    export CHROME_USER_DATA_DIR=~/.config/BraveSoftware/Brave-Browser-Nightly
fi
exec "/opt/brave.com/brave-nightly/brave-browser" "$USER_FLAGS" "$BRAVE_FLAGS" "$FLAG" "$@"

