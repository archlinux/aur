#!/usr/bin/bash

if [ -f /usr/bin/portable ]; then
	export _portalConfig=/usr/lib/wechat/portable-config
	portable $@
else
	/opt/wechat/wechat
fi