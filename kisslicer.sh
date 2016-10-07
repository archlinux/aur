#!/bin/sh

#Check if directory exists
if [ ! -d $HOME/.config/kisslicer ]
then
	mkdir -p $HOME/.config/kisslicer
fi

#Change into it and start
cd $HOME
/opt/kisslicer/KISSlicer -inidir $HOME/.config/kisslicer
