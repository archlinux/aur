#!/usr/bin/env bash

if [[ -z "${CHROME_USER_DATA_DIR}" ]]; then
    export CHROME_USER_DATA_DIR=~/.config/BraveSoftware/Brave-Browser-Beta
fi
exec "/opt/brave.com/brave-beta/brave-browser" "$BRAVE_FLAGS" "$FLAG" "$@"
