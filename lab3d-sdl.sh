#!/bin/sh

echo "lab3d-sdl 3.0 launcher"

mkdir -p ~/.lab3d-sdl

# hires texture config
if [ ! -f ~/.lab3d-sdl/wallparams.ini ]; then
  cp /usr/share/lab3d-sdl/wallparams.ini ~/.lab3d-sdl
fi

# run the game
cd ~/.lab3d-sdl && exec /usr/lib/lab3d-sdl/ken.bin "$@"
