#!/bin/bash

unset WINEPREFIX
if [ ! -d "$HOME"/.racer-nocg ] ; then
   mkdir -p "$HOME"/.racer-nocg
	touch "$HOME"/.racer-nocg/version
	echo "0.8.44-1" > "$HOME"/.racer-nocg/version
	cp /opt/racer-nocg/racer.ini "$HOME"/.racer-nocg/
	cp /opt/racer-nocg/server.ini "$HOME"/.racer-nocg/
	cp /opt/racer-nocg/lobbyserver.ini "$HOME"/.racer-nocg/
	ln -s /opt/racer-nocg/racer_nocg.exe "$HOME"/.racer-nocg/racer-nocg.exe || exit 1
	ln -s /opt/racer-nocg/racer_nocg.exe "$HOME"/.racer-nocg/racer.exe || exit 1
	ln -s /opt/racer-nocg/restart.exe "$HOME"/.racer-nocg/restart.exe || exit 1
	ln -s /opt/racer-nocg/fmodex.dll "$HOME"/.racer-nocg/fmodex.dll || exit 1
	ln -s /opt/racer-nocg/cg.dll "$HOME"/.racer-nocg/cg.dll || exit 1
	ln -s /opt/racer-nocg/cgGL.dll "$HOME"/.racer-nocg/cgGL.dll || exit 1
	ln -s /opt/racer-nocg/newton.dll "$HOME"/.racer-nocg/newton.dll || exit 1
	mkdir "$HOME"/.racer-nocg/data || exit 1
	ln -s /opt/racer-nocg/data/audio "$HOME"/.racer-nocg/data/audio || exit 1
	ln -s /opt/racer-nocg/data/cars "$HOME"/.racer-nocg/data/cars || exit 1
	cp -r /opt/racer-nocg/data/controls "$HOME"/.racer-nocg/data/controls || exit 1
	ln -s /opt/racer-nocg/data/drivers "$HOME"/.racer-nocg/data/drivers || exit 1
	mkdir -p "$HOME"/.racer-nocg/data/dump || exit 1
	ln -s /opt/racer-nocg/data/fonts "$HOME"/.racer-nocg/data/fonts || exit 1
	ln -s /opt/racer-nocg/data/gui "$HOME"/.racer-nocg/data/gui || exit 1
	ln -s /opt/racer-nocg/data/images "$HOME"/.racer-nocg/data/images || exit 1
	ln -s /opt/racer-nocg/data/locale "$HOME"/.racer-nocg/data/locale || exit 1
	ln -s /opt/racer-nocg/data/models "$HOME"/.racer-nocg/data/models || exit 1
	ln -s /opt/racer-nocg/data/music "$HOME"/.racer-nocg/data/music || exit 1
	ln -s /opt/racer-nocg/data/physics "$HOME"/.racer-nocg/data/physics || exit 1
	ln -s /opt/racer-nocg/data/plugins "$HOME"/.racer-nocg/data/plugins || exit 1
	ln -s /opt/racer-nocg/data/renderer "$HOME"/.racer-nocg/data/renderer || exit 1
	cp -r /opt/racer-nocg/data/replays "$HOME"/.racer-nocg/data/replays || exit 1
	ln -s /opt/racer-nocg/data/scripts "$HOME"/.racer-nocg/data/scripts || exit 1
	ln -s /opt/racer-nocg/data/tracks "$HOME"/.racer-nocg/data/tracks || exit 1
fi

cd "$HOME"/.racer-nocg/
WINEDEBUG=-all wine racer-nocg.exe "$@"