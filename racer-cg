#!/bin/bash

unset WINEPREFIX
if [ ! -d "$HOME"/.racer-cg ] ; then
   mkdir -p "$HOME"/.racer-cg
	touch "$HOME"/.racer-cg/version
	echo "0.8.44-1" > "$HOME"/.racer-cg/version
	cp /opt/racer-cg/racer.ini "$HOME"/.racer-cg/
	cp /opt/racer-cg/server.ini "$HOME"/.racer-cg/
	cp /opt/racer-cg/lobbyserver.ini "$HOME"/.racer-cg/
	ln -s /opt/racer-cg/racer.exe "$HOME"/.racer-cg/racer.exe || exit 1
	ln -s /opt/racer-cg/restart.exe "$HOME"/.racer-cg/restart.exe || exit 1
	ln -s /opt/racer-cg/fmodex.dll "$HOME"/.racer-cg/fmodex.dll || exit 1
	ln -s /opt/racer-cg/cg.dll "$HOME"/.racer-cg/cg.dll || exit 1
	ln -s /opt/racer-cg/cgGL.dll "$HOME"/.racer-cg/cgGL.dll || exit 1
	ln -s /opt/racer-cg/newton.dll "$HOME"/.racer-cg/newton.dll || exit 1
	mkdir "$HOME"/.racer-cg/data || exit 1
	ln -s /opt/racer-cg/data/audio "$HOME"/.racer-cg/data/audio || exit 1
	ln -s /opt/racer-cg/data/cars "$HOME"/.racer-cg/data/cars || exit 1
	cp -r /opt/racer-cg/data/controls "$HOME"/.racer-cg/data/controls || exit 1
	ln -s /opt/racer-cg/data/drivers "$HOME"/.racer-cg/data/drivers || exit 1
	mkdir -p "$HOME"/.racer-cg/data/dump || exit 1
	ln -s /opt/racer-cg/data/fonts "$HOME"/.racer-cg/data/fonts || exit 1
	ln -s /opt/racer-cg/data/gui "$HOME"/.racer-cg/data/gui || exit 1
	ln -s /opt/racer-cg/data/images "$HOME"/.racer-cg/data/images || exit 1
	ln -s /opt/racer-cg/data/locale "$HOME"/.racer-cg/data/locale || exit 1
	ln -s /opt/racer-cg/data/models "$HOME"/.racer-cg/data/models || exit 1
	ln -s /opt/racer-cg/data/music "$HOME"/.racer-cg/data/music || exit 1
	ln -s /opt/racer-cg/data/physics "$HOME"/.racer-cg/data/physics || exit 1
	ln -s /opt/racer-cg/data/plugins "$HOME"/.racer-cg/data/plugins || exit 1
	ln -s /opt/racer-cg/data/renderer "$HOME"/.racer-cg/data/renderer || exit 1
	cp -r /opt/racer-cg/data/replays "$HOME"/.racer-cg/data/replays || exit 1
	ln -s /opt/racer-cg/data/scripts "$HOME"/.racer-cg/data/scripts || exit 1
	ln -s /opt/racer-cg/data/tracks "$HOME"/.racer-cg/data/tracks || exit 1
fi

cd "$HOME"/.racer-cg/
WINEDEBUG=-all wine racer.exe "$@"