#!/bin/sh

# source application-specific settings
[ -f /etc/conf.d/c2ctl ] && . /etc/conf.d/c2ctl

if [ "$CORES" -a "$FID" -a "$VID" ]; then
	/usr/bin/c2ctl $CORES $FID $VID >& /dev/null
fi
