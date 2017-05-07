#!/bin/sh
cd /opt/gearhead

name=$(basename $0)

if [ $name = gearhead ]; then
	./gharena
elif [ $name = gearhead-sdl ]; then
	./gharena-sdl
fi

