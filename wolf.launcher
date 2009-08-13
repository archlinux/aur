#!/bin/sh
# Needed to make symlinks/shortcuts work.
# the binaries must run with correct working directory
cd "/opt/wolf"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:."
exec ./wolf.x86 "$@"

