#!/usr/bin/bash

if [ ${XDG_SESSION_TYPE} = wayland ]; then
	export launchTarget="/opt/discord/Discord --disable-setuid-sandbox --no-sandbox $@ --ozone-platform=wayland"
else
	export launchTarget="/opt/discord/Discord --disable-setuid-sandbox --no-sandbox $@"
fi

_portalConfig=/usr/lib/portable/info/com.discord.app/config portable