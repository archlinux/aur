#!/bin/bash

echo "[Info] received a request: $@"

if [ -f /usr/bin/dbus-send ]; then
	echo "[Info] Initiating D-Bus call..."
	dbus-send --print-reply --dest=org.freedesktop.FileManager1 \
		/org/freedesktop/FileManager1 \
		org.freedesktop.FileManager1.ShowItems \
		array:string:"file://${2}" \
		string:fake-dde-show-items
else
	if [ -f /usr/bin/dolphin ] && [ ${XDG_CURRENT_DESKTOP} = KDE ]; then
		/usr/bin/dolphin --select "$2"
	elif [ -f /usr/bin/nautilus ] && [ ${XDG_CURRENT_DESKTOP} = GNOME ]; then
		/usr/bin/nautilus $(dirname "$2")
	else
		xdg-open $(dirname "$2")
	fi
fi