#!/bin/env sh

echo ":: Launching CannonBall OutRun Engine"

if [ ! -f ~/.cannonball/roms ]; then
  mkdir -p ~/.cannonball/roms
fi

# config
if [ ! -f ~/.cannonball/config.xml ]; then
  cp /usr/share/cannonball/config.xml ~/.cannonball
fi

# widescreen tilemaps
if [ ! -h ~/.cannonball/res ]; then
  ln -s /usr/share/cannonball/res ~/.cannonball
fi

# run the game
cd ~/.cannonball && exec /usr/lib/cannonball/cannonball "$@"
