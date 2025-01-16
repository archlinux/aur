#!/bin/bash

export _portableConfig=md.obsidian.app
export launchTarget="electron34 /usr/lib/obsidian/app.asar --ozone-platform-hint=auto --enable-wayland-ime --wayland-text-input-version=3 $@"

if [[ "$@" = "--actions opendir" ]]; then
	portable --actions opendir
elif [[ "$@" = "--actions share-files" ]]; then
	portable --actions share-files
elif [[ "$@" = "--actions quit" ]]; then
	portable --actions quit
else
	portable
fi