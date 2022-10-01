#!/bin/bash

# check for dwarffortress user directory
if [[ ! -d ~/.dwarffortress ]] ; then
	echo "Error: dfhack-run passes commands to a running instance of\
 DFHack, but ~/.dwarffortress/ does not exist and should have been\
 created when dfhack was run" >&2
 	exit 1
fi

# check for dfhack user directory
if [[ ! -d ~/.dwarffortress/hack ]] ; then
	echo "Error: dfhack-run passes commands to a running instance of\
 DFHack, but ~/.dwarffortress/hack/ does not exist and should have been\
 created when dfhack was run" >&2
 	exit 1
fi

# workaround for bug in Debian/Ubuntu SDL patch
export SDL_DISABLE_LOCK_KEYS=1

cd ~/.dwarffortress
exec ./dfhack-run "$@"
