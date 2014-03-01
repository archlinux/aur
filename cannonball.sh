#!/bin/sh

echo "Cannonball launcher"

mkdir -p ~/.cannonball/roms

# config
if [ ! -f ~/.cannonball/config.xml ]; then
  cp /usr/share/cannonball/config.xml ~/.cannonball
fi

# run the game
cd ~/.cannonball && exec /usr/lib/cannonball/cannonball "$@"
