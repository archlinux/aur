#!/bin/bash

# Wine prefix not set, use default: man wine
if [ -z "$WINEPREFIX" ]; then
	export WINEPREFIX=$HOME/.wine
fi

progName="algodoo"
progRealPath="/usr/share/$progName/app"
progBin="Algodoo.exe"
wineTricksLog="$WINEPREFIX/winetricks.log"

# Detects if corefonts is installed and install it if don't
if ! grep -qw corefonts $wineTricksLog; then
	winetricks -q corefonts
fi

# Detects if vcrun2008 is installed and install it if don't
if ! grep -qw vcrun2008 $wineTricksLog; then
	winetricks -q vcrun2008
fi

# msvcp90 MUST be overriden https://www.reddit.com/r/linuxquestions/comments/6g077y/wine_error_class_not_registered/dqn9c8k/
export WINEDLLOVERRIDES="msvcp90=n"
wine $progRealPath/$progBin "$@"

