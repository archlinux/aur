#!/bin/sh

# constants
GAMEPATH="/usr/share/sm64coopdx"
SAVEPATH="$HOME/.local/share/sm64coopdx"

# create the save directory if it doesn't exist
mkdir -p "$SAVEPATH"

# run the game
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GAMEPATH" "$GAMEPATH/sm64coopdx" --savepath "$SAVEPATH" "$@"