#!/bin/sh

game=/opt/ankama/dofus/Dofus
# Use padsp or the game may not play sounds with PulseAudio
if which padsp
then
  padsp "$game" "$@"
else
  "$game" "$@"
fi
