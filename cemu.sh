#!/bin/bash
export WINEPREFIX="$HOME/.cemu/wine"
export WINEDLLOVERRIDES="mscoree=;mshtml=;dbghelp.dll=n,b"

if [ ! -d "$HOME"/.cemu ] ; then
  mkdir -p "$HOME"/.cemu/wine || exit 1
  ln -s /usr/share/cemu/Cemu.exe "$HOME"/.cemu/Cemu.exe || exit 1
  ln -s /usr/share/cemu/dbghelp.dll "$HOME"/.cemu/dbghelp.dll || exit 1
  ln -s /usr/share/cemu/keystone.dll "$HOME"/.cemu/keystone.dll || exit 1
  ln -s /usr/share/cemu/gameProfiles "$HOME"/.cemu/gameProfiles || exit 1
  ln -s /usr/share/cemu/graphicPacks "$HOME"/.cemu/graphicPacks || exit 1
  cp -r /usr/share/cemu/hfiomlc01 "$HOME"/.cemu/ || exit 1
  cp -r /usr/share/cemu/mlc01 "$HOME"/.cemu/ || exit 1
  cp -r /usr/share/cemu/shaderCache "$HOME"/.cemu/ || exit 1
fi

cd ~/.cemu
wine "$HOME"/.cemu/Cemu.exe "$@"
