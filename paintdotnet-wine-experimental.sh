#!/bin/bash
set -euo pipefail
# match the DIR and PREFIX from official install.sh
DIR="$HOME/.local/share/paintdotnet"
PREFIX="$DIR/wineprefix"

INSTALLED_DIR="/usr/share/pkgname"

# if something need to be added to prefix (like another winetricks) changing this allows me to redo "prefix creation"
UPDATE_FILE="$PREFIX/update1"

export WINEDLLOVERRIDES="mshtml=;d3dcompiler_47=n"
export WINEPREFIX="$PREFIX"
export WINEDEBUG="${WINEDEBUG:--all}"
export DXVK_LOG_LEVEL="${DXVK_LOG_LEVEL:-error}"


if [[ ! -f "$UPDATE_FILE" ]]; then
  mkdir -p "$PREFIX"

  wineboot --init

  winecfg -v win11
  wine reg.exe add 'HKCU\Control Panel\Desktop' /v FontSmoothingType /t REG_DWORD /d 2 /f

  winetricks -q dxvk

  wineserver -w
  touch "$UPDATE_FILE"
fi

# I don't like that but... portable Paint.NET like to write to it's instalation directory (PaintDotNet.AppSettings.json)
# And also make plugin and stuff easier to install as do not requrie root
# But... we need to run it every time in case there was an update
TARGET="$DIR/paintdotnet"

# create equivalent folder
mkdir -p "$TARGET"
find "$INSTALLED_DIR" -mindepth 1 -type d -print0 |
while IFS= read -r -d '' d; do
    GOAL="$TARGET/${d#"$INSTALLED_DIR"/}"
    mkdir -p "$GOAL"
done

find "$INSTALLED_DIR" -type f -print0 |
while IFS= read -r -d '' f; do
    GOAL="$TARGET/${f#"$INSTALLED_DIR"/}"
    [[ -e "$GOAL" || -L "$GOAL" ]] || ln -s "$f" "$GOAL"
done


# This is kind of a workaround
# This disable logic of VK_LAYER_MND_enable_timeline_semaphore which seems to cause issue with vulkan device creation for some users
# using GTX 1080 using 580 driver to be exact, with monado-vulkan-layers-git installed
export NO_ENABLE_TIMELINE_SEMAPHORE=1

wine "$TARGET/paintdotnet.exe" "$@"


