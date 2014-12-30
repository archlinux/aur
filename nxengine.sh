#!/bin/sh
#
# launcher for nxengine by carstene1ns 2014
#

# create jail folder
mkdir -p "$HOME"/.nxengine

# link data, if needed
if [ ! -L "$HOME"/.nxengine/data ]; then
  ln -s -t "$HOME"/.nxengine /usr/share/nxengine/{Doukutsu.exe,data,font.ttf,nx,smalfont.bmp,sprites.sif,tilekey.dat}
fi

# change to game dir and launch
cd "$HOME"/.nxengine && exec ./nx "$@"

# eof
