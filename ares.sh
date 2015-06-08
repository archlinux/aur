#!/bin/bash

export WINEDLLOVERRIDES="mshtml="
export WINEPREFIX="$HOME/.ares"

if [ ! -d "$HOME"/.ares ] ; then
  mkdir -p "$HOME"/.ares || exit 1
fi

wine /usr/share/ares/Ares.exe "$@"

