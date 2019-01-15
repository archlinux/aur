#!/bin/bash

SAVE_DIR=~/.AndroidStudio_sdk_local
MOUNT_DIR=~/.AndroidStudio_sdk

if whereis android-studio>/dev/null 2>&1; then
	if whereis unionfs-fuse>/dev/null 2>&1; then 
		mkdir -p $SAVE_DIR
		mkdir -p $MOUNT_DIR

		unionfs -o cow -o umask=000 $SAVE_DIR=RW:/opt/android-sdk=RO $MOUNT_DIR
	else
		echo "==> Please be sure to have union-fuse installed in your path"
	fi
else
	echo "==> Please be sure to have android-studio installed in your path"
fi

ANDROID_HOME=$(realpath $MOUNT_DIR) android-studio "$@"

fusermount -u ~/.AndroidStudio_sdk
