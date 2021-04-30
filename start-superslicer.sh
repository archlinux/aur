#!/bin/bash

if [ -d "$HOME/.SuperSlicer" ] && [ ! -d "$HOME/.config/SuperSlicer-alpha" ]
then
	echo "copy data from ~/.SuperSlicer to the new data folder ~/.config/SuperSlicer-alpha"
	cp -r "$HOME/.SuperSlicer" "$HOME/.config/SuperSlicer-alpha"
fi

LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/wxgtk-dev/lib" /usr/share/SuperSlicer/superslicer "$@"
