#!/bin/bash

import_settings()
{
	if [ -d "$1" ] && [ ! -d "$HOME/.config/SuperSlicer" ]
	then
		echo "import data from $1 to the new data folder ~/.config/SuperSlicer"
		cp -r "$HOME/.SuperSlicer" "$HOME/.config/SuperSlicer"
	fi
}

import_settings "$HOME/.SuperSlicer"
import_settings "$HOME/.config/SuperSlicer-alpha"

/usr/share/SuperSlicer/superslicer "$@"
