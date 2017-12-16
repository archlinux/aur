#!/bin/bash

declare SHAR_PATH
USER_SHAR_PATH="$HOME/.local/share/the-simpsons-hit-and-run"
SYSTEM_SHAR_PATH="/usr/share/the-simpsons-hit-and-run"

if [[ -d "$USER_SHAR_PATH" ]]; then
  SHAR_PATH=$USER_SHAR_PATH
elif [[ -d "$SYSTEM_SHAR_PATH" ]]; then
  SHAR_PATH=$SYSTEM_SHAR_PATH
else
  zenity --title "The Simpsons: Hit & Run" --width 500 --error --text "The Simpsons: Hit &amp; Run \
game files not found. Please move the contents of your installation to either $USER_SHAR_PATH or \
$SYSTEM_SHAR_PATH."
fi

if [[ -n $SHAR_PATH  ]]; then
  # Set the working directory to the game's directory because it's not able to access its files
  # otherwise.
  (cd "$SHAR_PATH" && taskset -c 0 wine "$SHAR_PATH/Simpsons.exe")
fi