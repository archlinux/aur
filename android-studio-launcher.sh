#!/bin/bash

if whereis android-studio>/dev/null 2>&1; then
	if whereis unionfs-fuse>/dev/null 2>&1; then 
		mkdir -p ~/.AndroidStudio2.1/sdk_local
		mkdir -p ~/.AndroidStudio2.1/sdk

		unionfs -o cow -o umask=000 ~/.AndroidStudio2.1/sdk_local=RW:/opt/android-sdk=RO ~/.AndroidStudio2.1/sdk
	else
		echo "==> Please be sure to have union-fuse installed in your path"
	fi
else
	echo "==> Please be sure to have android-studio installed in your path"
fi

android-studio "$@"

fusermount -u ~/.AndroidStudio2.1/sdk
