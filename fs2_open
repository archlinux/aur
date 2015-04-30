#!/bin/sh

if [ -r "$HOME"/.fs2_open/options ]; then
	. "$HOME"/.fs2_open/options
else
	. /usr/share/fs2_open/options
fi

cd /opt/fs2_open

/opt/fs2_open/fs2_open_3.7.2 "$@" "$FS2OPTS"
