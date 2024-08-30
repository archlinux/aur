#!/bin/bash

if [[ $@ =~ "https://" ]] || [[ $@ =~ "http://" ]]; then
	echo "[Info] Received a request: $@, interpreting as link"
	/usr/lib/flatpak-xdg-utils/xdg-open "$@"
	exit $?
fi

if [ ${trashAppUnsafe} ]; then
	link="$2"
else
	fakeDirBase="${XDG_DOCUMENTS_DIR}/xwechat_files"
	realDirBase="${XDG_DATA_HOME}/WeChat_Data/Documents/xwechat_files"
	link=$(echo "$2" | sed "s|${fakeDirBase}|${reakDirBase}|g")
	#link=$(echo "$2" | awk -v oldPath="${fakeDirBase}" -v newPath=${reakDirBase} '{gsub(oldPath, newPath)} 1')
fi

link="${realDirBase}${link}"

echo "[Info] received a request: $@, translated to ${link}"

/usr/lib/flatpak-xdg-utils/xdg-open $(dirname "${link}")

if [[ $? = 0 ]]; then
	exit 0
fi

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
