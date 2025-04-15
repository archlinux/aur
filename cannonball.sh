#!/bin/bash
#
# Cannonball launcher
#

CANNONBALL_HOME="/opt/cannonball"

mkdir -p ~/.cannonball/roms

# config
if [[ ! -f ~/.cannonball/config.xml ]]; then
  cp "$CANNONBALL_HOME"/config.xml ~/.cannonball
fi

# widescreen tilemaps
if [[ ! -h ~/.cannonball/res ]]; then
  ln -s "$CANNONBALL_HOME"/res ~/.cannonball
fi

# run the game
cd ~/.cannonball && exec "$CANNONBALL_HOME"/cannonball "$@"
