#!/bin/sh

mkdir -p $HOME/.xbak

# run the game
cd $HOME/.xbak && exec /usr/lib/xbak/xbak "$@"
