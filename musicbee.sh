#!/bin/bash

PROGRAM_NAME="musicbee"

DIR="$HOME/.$PROGRAM_NAME"
PREFIX="$DIR/wine"

export export WINEARCH=win32 WINEPREFIX="$PREFIX"

if [ ! -d "$HOME"/.$PROGRAM_NAME ] ; then
  mkdir -p "$HOME"/.$PROGRAM_NAME/wine || exit 1

  winetricks -q dotnet48 xmllite gdiplus

  cp -r /usr/share/$PROGRAM_NAME/Configuration.xml "$HOME"/.$PROGRAM_NAME || exit 1

  ln -s /usr/share/$PROGRAM_NAME/* "$HOME"/.$PROGRAM_NAME/ || exit 1

  ln -s $PREFIX/drive_c/users/$USER/AppData/Roaming/MusicBee/ $PREFIX/MS_Config

  #echo "WINEPREFIX=$PREFIX winecfg" >| winecfg.sh
  #chmod +x $PREFIX/winecfg.sh
fi

wine "$HOME"/.$PROGRAM_NAME/$PROGRAM_NAME "$@"
