#!/bin/bash

set -e

APP="sakura-editor"
PREFIX="$HOME/.local/share/$APP"
WINEPREFIX="$PREFIX"
export WINEPREFIX

SYSTEM_EXE="/usr/share/$APP/sakura.exe"
WINE_EXE="$PREFIX/drive_c/Program Files (x86)/sakura/sakura.exe"

# initial setup
if [ ! -f "$WINE_EXE" ]; then
    echo "[INFO] First run setup for $APP ..."
    # disable Gecko/Mono installation prompts
    export WINEDLLOVERRIDES="mscoree,mshtml="
    wineboot
    winetricks -q cjkfonts fakejapanese
    
    mkdir -p "$(dirname "$WINE_EXE")"
    cp "$SYSTEM_EXE" "$WINE_EXE"
    echo "[INFO] Installation done."
fi

exec wine "$WINE_EXE" "$@"
