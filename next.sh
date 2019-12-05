#!/bin/bash

# Put your SDL2 Config string into this file so it gets automatically set at start
file="$HOME/neXt/controllerconfigs.txt"
if [ -e "$file" ]; then
	contents="`cat $file`";
	export SDL_GAMECONTROLLERCONFIG="$contents";
	echo "Set SDL_GAMECONTROLLERCONFIG to $contents";
else
        echo "No ~/neXt/controllerconfigs.txt found";
fi;


cd /opt/next/
./neXt.x86_64
