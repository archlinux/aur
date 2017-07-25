#!/bin/bash
if [ "$1" = "pre" ]; then
	/usr/bin/modprobe -r hid_ntrig
elif [ "$1" = "post" ]; then
	/usr/bin/modprobe hid_ntrig
fi
