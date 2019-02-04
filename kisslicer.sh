#!/bin/sh

#Check if XDG_CONFIG_HOME is set, and set it if it isn't
if [ -z "$XDG_CONFIG_HOME" ]
then
	echo "XDG_CONFIG_HOME is not set, setting it to ~/.config"
	export XDG_CONFIG_HOME="$HOME/.config"
fi

#Check if directory exists
if [ ! -d $XDG_CONFIG_HOME/kisslicer ]
then
	mkdir -p $XDG_CONFIG_HOME/kisslicer
fi

#Change into it and start
cd $HOME
/opt/kisslicer/KISSlicer -inidir $XDG_CONFIG_HOME/kisslicer
