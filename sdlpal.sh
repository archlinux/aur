#!/usr/bin/env bash

if [ ! -d $HOME/.sdlpal ] ; then
	echo "No game data, please put them under $HOME/.sdlpal"
	exit 1
fi
cd $HOME/.sdlpal/
exec /usr/share/sdlpal/sdlpal
