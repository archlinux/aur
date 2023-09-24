#!/bin/bash

export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/musicplayer2/wine"
if [ ! -d "${WINEPREFIX}" ]; then
    mkdir -p "${WINEPREFIX}"
    winetricks -q vcrun2022
fi
wine /usr/share/musicplayer2/MusicPlayer2.exe "$@"
