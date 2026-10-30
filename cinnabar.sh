#!/bin/sh
# pacman owns this install, so in-app update checks could only fetch releases they can't apply.
export CINNABAR_UPDATE_CHECK=0
exec /opt/cinnabar/bin/cinnabar "$@"
