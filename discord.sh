#!/usr/bin/bash

if [ ${XDG_SESSION_TYPE} = wayland ]; then
	export launchTarget="/opt/discord/Discord --disable-setuid-sandbox --no-sandbox $@ --ozone-platform-hint=auto --wayland-text-input-version=3"
else
	export launchTarget="/opt/discord/Discord --disable-setuid-sandbox --no-sandbox $@"
fi

export _portalConfig=/usr/lib/portable/info/com.discord.app/config

if [[ "$@" = "--actions opendir" ]]; then
	exec portable --actions opendir
elif [[ "$@" = "--actions share-files" ]]; then
	exec portable --actions share-files
elif [[ "$@" = "--actions quit" ]]; then
	exec portable --actions quit
else
	exec portable "$@"
fi
