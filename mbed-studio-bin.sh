#!/usr/bin/env bash

USR_TOOLS_PATH="$HOME/.config/Mbed Studio/mbed-studio-tools"

if [ ! -d "$USR_TOOLS_PATH" ]; then
    mkdir -p "$HOME/.config/Mbed Studio"
    ln -s "/usr/share/mbed-studio-bin/mbed-studio-tools" "$USR_TOOLS_PATH"
fi

/usr/share/mbed-studio-bin/mbed-studio
