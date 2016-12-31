#!/bin/bash

if whereis android-studio>/dev/null 2>&1; then
	if whereis unionfs-fuse>/dev/null 2>&1; then 
		mkdir -p ~/.AndroidStudio_sdk_local
		mkdir -p ~/.AndroidStudio_sdk

		unionfs -o cow -o umask=000 ~/.AndroidStudio_sdk_local=RW:/opt/android-sdk=RO ~/.AndroidStudio_sdk
	else
		echo "==> Please be sure to have union-fuse installed in your path"
	fi
else
	echo "==> Please be sure to have android-studio installed in your path"
fi

android-studio "$@"

fusermount -u ~/.AndroidStudio_sdk
