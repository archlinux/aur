#!/bin/bash

export _portableConfig=md.obsidian.app

if [ ${XDG_SESSION_TYPE} = "wayland" ]; then
	export _flag="--ozone-platform=wayland"
else
	export _flag=''
fi

#export launchTarget="--enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL ${_flag} --enable-wayland-ime --wayland-text-input-version=3 $@"

if [[ "$@" = "--actions opendir" ]]; then
	portable --actions opendir
elif [[ "$@" = "--actions share-files" ]]; then
	portable --actions share-files
elif [[ "$@" = "--actions quit" ]]; then
	portable --actions quit
else
	portable -- --enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL --enable-wayland-ime --wayland-text-input-version=3 ${_flag} $@
fi
