#!/bin/bash
export WINEPREFIX="$HOME/.knyttstories/wine"

# Before running the game for the first time, some stuff needs to be done.

# Set some symlinks and prepare the game environment.
if [ ! -d "$HOME"/.knyttstories ] ; then
  mkdir -p "$HOME"/.knyttstories/{wine,Saves} || exit 1
  ln -s /usr/share/knyttstories/"Knytt Stories".exe "$HOME"/.knyttstories/knyttstories || exit 1
  ln -s /var/games/knyttstories/Worlds "$HOME"/.knyttstories/Worlds || exit 1
  cp -r /usr/share/knyttstories/Data "$HOME"/.knyttstories/ || exit 1
fi

# We need the system32 directory to exist prior to attempting to copy the requireddll file.
if [ ! -d "$HOME"/.knyttstories/wine/drive_c/windows/system32 ]; then
  mkdir -p "$HOME"/.knyttstories/wine/drive_c/windows/system32 || exit 1
fi

# Copy the msvcp60.dll file to the system32 directory or the game won't run
if [ ! -f "$HOME"/.knyttstories/wine/drive_c/windows/system32/msvcp60.dll ]; then
  ln -s /usr/share/knyttstories/msvcp60.dll "$HOME"/.knyttstories/wine/drive_c/windows/system32/msvcp60.dll || exit 1
fi

# Run the game
wine "$HOME"/.knyttstories/knyttstories "$@"

