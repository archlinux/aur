#!/bin/sh

# constants
PKGNAME="sm64coopdx"

GAMEPATH="/usr/share/$PKGNAME"
LIBPATH="/usr/lib/$PKGNAME"
SAVEPATH="$HOME/.local/share/$PKGNAME"

# create the save directory if it doesn't exist
mkdir -p "$SAVEPATH"

# run the game
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIBPATH" "$GAMEPATH/$PKGNAME" --savepath "$SAVEPATH" "$@"