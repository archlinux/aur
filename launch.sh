#!/bin/sh
# Launch script for Legends of Equestria

# Change to game directory
GAMEPATH="/opt/legends-of-equestria/loe"

# What architecture are we running?
MACHINE=`uname -m`
if [ "$MACHINE" = "x86_64" ]
then
	# Set path to binary (64 bit)
	BIN="loe.x86_64"
else
	# Default to x86
	BIN="loe.x86"
fi

# Run the game, (optionally) with the debugger
"$GAMEPATH/$BIN" "$@"

# Get the game's exit code, and return it.
e=$?
exit $e
