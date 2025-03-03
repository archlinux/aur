#!/usr/bin/bash

if [ ${XDG_SESSION_TYPE} = wayland ]; then
	export launchTarget="/opt/discord/Discord --disable-setuid-sandbox --no-sandbox $@ --ozone-platform-hint=auto" --wayland-text-input-version=3
else
	export launchTarget="/opt/discord/Discord --disable-setuid-sandbox --no-sandbox $@"
fi

export _portalConfig=/usr/lib/portable/info/com.discord.app/config

if [[ "$@" = "--actions opendir" ]]; then
	portable --actions opendir
elif [[ "$@" = "--actions share-files" ]]; then
	portable --actions share-files
elif [[ "$@" = "--actions quit" ]]; then
	portable --actions quit
else
	portable "$@"
fi
