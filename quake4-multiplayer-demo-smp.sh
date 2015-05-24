#!/bin/sh
cd /opt/quake4-multiplayer-demo
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:."
exec ./quake4smp.x86 "$@"