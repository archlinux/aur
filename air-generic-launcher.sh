#!/bin/bash

# This is a generic launcher script for AIR applications on Arch Linux

SCRIPT_PATH=`readlink -f $0`
SCRIPT_DIR=`dirname $SCRIPT_PATH`
BASE_DIR=`readlink -f $SCRIPT_DIR/..`

if [ "`uname -m`" == "x86_64" ]; then
	export GTK_PATH=/usr/lib32/gtk-2.0
	export G_FILENAME_ENCODING=UTF-8
fi

/opt/adobe-air-sdk/bin/adl -nodebug $BASE_DIR/share/META-INF/AIR/application.xml $BASE_DIR/share -- $*

