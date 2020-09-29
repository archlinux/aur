#!/usr/bin/env bash

if [[ -z "${CHROME_USER_DATA_DIR}" ]]; then
    export CHROME_USER_DATA_DIR=~/.config/BraveSoftware/Brave-Browser-Dev
fi
exec "/opt/brave.com/brave-dev/brave-browser" "$BRAVE_FLAGS" "$FLAG" "$@"
