#!/bin/bash

if [ -z "$1" ]; then
	echo "Error, File Name/Path Not Specified!"
elif [[ -f "$1" ]]; then
	sha512sum "$1" | cut -d " " -f 1
else
	echo "Error, File Does Not Exist!"
fi
