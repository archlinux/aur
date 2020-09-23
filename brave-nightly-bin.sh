#!/usr/bin/env bash

if [[ -z "${CHROME_USER_DATA_DIR}" ]]; then
    export CHROME_USER_DATA_DIR=~/.config/BraveSoftware/Brave-Browser-Nightly
fi
exec "/opt/brave.com/brave-nightly/brave-browser" "$BRAVE_FLAGS" "$FLAG" "$@"
