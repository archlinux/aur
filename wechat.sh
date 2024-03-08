#!/bin/bash

function launch() {
	if [ ! -d "${HOME}/Documents/WeChat_Data" ]; then
		mkdir -p ${HOME}/Documents/WeChat_Data
	fi

	local wechat_data="${HOME}/Documents/WeChat_Data"
	local wechat_exe="/opt/wechat-beta/wechat"
	local wechat_uos_dir="/usr/share/wechat-uos"

	# Ensure WeChat data directory exists
	if [ ! -d "$wechat_data" ]; then
			mkdir -p "$wechat_data"
	fi

	echo "Launching WeChat Beta..."
	bwrap \
		--dev-bind / / \
		--bind "$wechat_data" "$HOME" \
		--ro-bind "$wechat_uos_dir/var/" /var/ \
		--ro-bind "$wechat_uos_dir/etc/os-release" /etc/os-release \
		--ro-bind "$wechat_uos_dir/etc/lsb-release" /etc/lsb-release \
		--ro-bind "/usr/lib/qt/plugins/platforms" "/usr/lib/qt/plugins/platforms" \
		--ro-bind-try "/usr/lib/snapd-xdg-open/xdg-open" "/usr/bin/xdg-open" \
		--setenv QT_IM_MODULE fcitx \
		--setenv QT_QPA_PLATFORMTHEME qt5ct \
		--setenv GTK_USE_PORTAL 1 \
		"$wechat_exe" "$@"
}

launch $@
