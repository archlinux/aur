#!/usr/bin/bash

function sourceXDG() {
	if [[ ! "${XDG_DATA_HOME}" ]]; then
		export XDG_DATA_HOME="${HOME}/.local/share"
	fi
}

sourceXDG
install \
	-vDm755 \
	/usr/share/discord-bwrap/settings.json \
	"${XDG_DATA_HOME}/Discord_Data/.config/discord/settings.json"

export _portalConfig=/usr/lib/portable/info/com.discord.app/config

if [[ "$@" = "--actions opendir" ]]; then
	exec portable --actions opendir
elif [[ "$@" = "--actions share-files" ]]; then
	exec portable --actions share-files
elif [[ "$@" = "--actions quit" ]]; then
	exec portable --actions quit
else
	exec portable -- "$@"
fi
