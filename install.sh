#!/usr/bin/env bash

VERSION="160_55"

if [ -f /home/$(whoami)/.local/share/Kolossus-Launcher/Kolossus\ Launcher.x86_64 ]; then
	if [ $(cat /home/$(whoami)/.local/share/Kolossus-Launcher/version.txt) == $VERSION ]; then
		exec /home/$(whoami)/.local/share/Kolossus-Launcher/Kolossus\ Launcher.x86_64
	else
		cp -r /opt/Kolossus-Launcher /home/$(whoami)/.local/share
		echo $VERSION > /home/$(whoami)/.local/share/Kolossus-Launcher/version.txt
		exec /home/$(whoami)/.local/share/Kolossus-Launcher/Kolossus\ Launcher.x86_64
	fi
else
	cp -r /opt/Kolossus-Launcher /home/$(whoami)/.local/share
	echo $VERSION > /home/$(whoami)/.local/share/Kolossus-Launcher/version.txt
	exec /home/$(whoami)/.local/share/Kolossus-Launcher/Kolossus\ Launcher.x86_64
fi
