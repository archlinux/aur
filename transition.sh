#!/bin/sh
# Having this variable set can make transition segfault
unset SESSION_MANAGER

# If default openssl is 1.1.1, the updater will crash
export LD_RUN_PATH=/usr/lib/openssl-1.0

transition=/opt/ankama/transition/transition

# If in PulseAudio, need padsp for the game to play sounds
if which padsp > /dev/null
then
  padsp "$transition" "$@"
else
  "$transition" "$@"
fi
