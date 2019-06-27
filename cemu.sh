#!/bin/bash
export WINEPREFIX="$HOME/.cemu/wine"
export WINEDLLOVERRIDES="mscoree=;mshtml=;dbghelp.dll=n,b"

if [ ! -d "$HOME"/.cemu ] ; then
  mkdir -p "$HOME"/.cemu/wine || exit 1
  ln -s /usr/share/cemu/Cemu.exe "$HOME"/.cemu/Cemu.exe || exit 1
  ln -s /usr/share/cemu/dbghelp.dll "$HOME"/.cemu/dbghelp.dll || exit 1
  ln -s /usr/share/cemu/keystone.dll "$HOME"/.cemu/keystone.dll || exit 1
  ln -s /usr/share/cemu/gameProfiles "$HOME"/.cemu/gameProfiles || exit 1
  cp -r /usr/share/cemu/hfiomlc01 "$HOME"/.cemu/ || exit 1
  cp -r /usr/share/cemu/mlc01 "$HOME"/.cemu/ || exit 1
  cp -r /usr/share/cemu/shaderCache "$HOME"/.cemu/ || exit 1
fi

if [ -z `winetricks list-installed|grep vcrun2015` ]; then
  if [ -n "`whereis zenity|grep bin`" ]; then
    zenity --info  --title 'Cemu' --text 'Installing wine dependencies.\n\nThe process may take a few minutes'
  fi
  winetricks -q vcrun2015
  winetricks settings win7
fi
cd ~/.cemu
wine Cemu.exe "$@"
