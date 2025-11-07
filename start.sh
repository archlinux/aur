#!/bin/bash
export _portableConfig="com.futunn.ftnn-desktop"

if [[ "$@" = "--actions quit" ]]; then
	exec portable --actions quit
else
	exec portable -- "$@"
fi
