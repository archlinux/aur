#!/usr/bin/bash

if [ -f /usr/lib/wechat/alt.desktop ]; then
	install -Dm644 \
		/usr/lib/wechat/alt.desktop \
		~/.local/share/applications/com.qq.weixin.desktop
fi

if [ -f /usr/bin/portable ] && [ ! -f /usr/lib/wechat/portable-config ]; then # Keep this for users prior to the merge
	echo "You'll need to install wechat-bwrap for sandboxing to work!"
	notify-send "You'll need to install wechat-bwrap for sandboxing to work!"
	zenity --error --title "Sandbox non-functional" --icon=security-low-symbolic --text "Please install aur/wechat-bwrap"
fi

if [ -f /usr/bin/wechat-sandbox-provider ]; then
	/usr/bin/wechat-sandbox-provider "$@"
else
	/opt/apps/com.tencent.wechat/files/wechat $@
fi