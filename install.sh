#!/usr/bin/env bash

VERSION="170_2"

PATH_TO_INSTALL="/home/$(whoami)/.local/share"


if [ -f $PATH_TO_INSTALL/Kolossus-Launcher/Kolossus\ Launcher.x86_64 ]; then
	if [ $(cat $PATH_TO_INSTALL/Kolossus-Launcher/version.txt) == $VERSION ]; then
		exec $PATH_TO_INSTALL/Kolossus-Launcher/Kolossus\ Launcher.x86_64
	else
		cp -r /opt/Kolossus-Launcher $PATH_TO_INSTALL
		echo $VERSION > $PATH_TO_INSTALL/Kolossus-Launcher/version.txt
		exec $PATH_TO_INSTALL/Kolossus-Launcher/Kolossus\ Launcher.x86_64
	fi
else
	cp -r /opt/Kolossus-Launcher $PATH_TO_INSTALL
	echo $VERSION > $PATH_TO_INSTALL/Kolossus-Launcher/version.txt
	exec $PATH_TO_INSTALL/Kolossus-Launcher/Kolossus\ Launcher.x86_64
fi
