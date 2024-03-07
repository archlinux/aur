#!/bin/bash

function launch() {
	if [ ! -d "${HOME}/Documents/WeChat_Data" ]; then
		mkdir -p ${HOME}/Documents/WeChat_Data
	fi
	echo "Launching WeChat Beta..."
	bwrap \
		--dev-bind / / \
		--bind ${HOME}/Documents/WeChat_Data ${HOME} \
		--ro-bind /usr/share/wechat-uos/var/ /var/ \
		--ro-bind /usr/share/wechat-uos/etc/os-release /etc/os-release \
		--ro-bind /usr/share/wechat-uos/etc/lsb-release /etc/lsb-release \
		--ro-bind /usr/lib/qt/plugins/platforms /usr/lib/qt/plugins/platforms \
		--ro-bind-try /usr/lib/snapd-xdg-open/xdg-open /usr/bin/xdg-open \
		--setenv QT_IM_MODULE fcitx \
		--setenv QT_QPA_PLATFORMTHEME qt5ct \
		--setenv GTK_USE_PORTAL 1 \
		/opt/wechat-beta/wechat $@
}

launch $@
