#!/bin/bash

echo "[Info] received a request: $@"

fakeDirBase="${XDG_DOCUMENTS_DIR}/xwechat_files"
realDirBase="${XDG_DATA_HOME}/WeChat_Data/Documents/xwechat_files"

link=$(echo "$2" | sed "s|${fakeDirBase}|${reakDirBase}|g")

if [ -f /usr/bin/dbus-send ]; then
	echo "[Info] Initiating D-Bus call..."
	dbus-send --print-reply --dest=org.freedesktop.FileManager1 \
		/org/freedesktop/FileManager1 \
		org.freedesktop.FileManager1.ShowItems \
		array:string:"file://${link}" \
		string:fake-dde-show-items
else
	if [ -f /usr/bin/dolphin ] && [ ${XDG_CURRENT_DESKTOP} = KDE ]; then
		/usr/bin/dolphin --select "${link}"
	elif [ -f /usr/bin/nautilus ] && [ ${XDG_CURRENT_DESKTOP} = GNOME ]; then
		/usr/bin/nautilus $(dirname "${link}")
	else
		xdg-open $(dirname "${link}")
	fi
fi