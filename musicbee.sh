#!/bin/bash

PROGRAM_NAME="musicbee"
DIR="$HOME/.$PROGRAM_NAME"
PREFIX="$DIR/wine"

export WINEARCH=win32
export WINEPREFIX="$PREFIX"

# Check if running under Wayland
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
  echo "Wayland support is ENABLED"
  export DISPLAY=:0
else
  echo "Wayland support is DISABLED"
fi

if [[ ! -d "$DIR" ]]; then
  mkdir -p "$DIR/wine" || exit 1

  winetricks -q dotnet48 xmllite gdiplus || exit 1
  wine reg.exe add HKCU\\Software\\Wine\\Drivers /v Graphics /d x11,wayland

  cp -r "/usr/share/$PROGRAM_NAME/Configuration.xml" "$DIR" || exit 1

  directories=("BBplugin" "Codec" "Equaliser" "Localisation" "Plugins" "Skins" "Tooltips")
  for directory in "${directories[@]}"; do
    mkdir -p "$DIR/$directory" || exit 1
  done

  ln -s "/usr/share/$PROGRAM_NAME/"* "$DIR/"

  ln -s "$PREFIX/drive_c/users/$USER/AppData/Roaming/MusicBee/" "$PREFIX/MS_Config"
fi

wine "$DIR/$PROGRAM_NAME.exe" "$@"
