#!/usr/bin/bash

if [ -f /usr/bin/portable ] && [ -f /usr/lib/wechat/portable-config ]; then
	export _portalConfig=/usr/lib/wechat/portable-config
	portable $@
elif [ -f /usr/bin/portable ]; then
	echo "You'll need to install wechat-bwrap for sandboxing to work!"
	notify-send "You'll need to install wechat-bwrap for sandboxing to work!"
	zenity --error --title "Sandbox non-functional" --icon=security-low-symbolic --text "Please install aur/wechat-bwrap"
else
	/opt/wechat/wechat $@
fi