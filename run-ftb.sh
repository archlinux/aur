#!/bin/sh
if [ ! -d "$HOME/.local/share/FTBA" ]; then
	mkdir -p "$HOME/.local/share"
	cp -R /opt/FTBA "$HOME/.local/share"
fi
"$HOME/.local/share/FTBA/FTBApp"
