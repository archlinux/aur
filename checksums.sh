#!/bin/sh
# Checksums v0.5
# Licensed under GPL3
# 
# For original author please refer to:
# http://kde-look.org/content/show.php/KonqCheckSum?content=83460

md5=`md5sum $1 | awk '{ print $1;}'`
sha1=`sha1sum $1 | awk '{ print $1;}'`
sha256=`sha256sum $1 | awk '{ print $1;}'`
ERROR=0
N=3

if [ -f $1.md5 ]; then
	refmd5=`cat $1.md5 | awk '{ print $1;}'`
	if [ "$md5" != "$refmd5" ]; then
		kdialog --icon=security-low.png --sorry "md5 doesn't match!"
		ERROR=1
	fi
else
	let N=$N-1
fi
		
if [ -f $1.sha1 ]; then
	refsha1=`cat $1.sha1 | awk '{ print $1;}'`
	if [ "$sha1" != "$refsha1" ]; then
		kdialog --icon=security-low.png --sorry "sha1 doesn't match!"
		ERROR=1
	fi
else
	let N=$N-1
fi

if [ -f $1.sha256 ]; then
	refsha256=`cat $1.sha256 | awk '{ print $1;}'`
	if [ "$sha256" != "$refsha256" ]; then
		kdialog --icon=security-low.png --sorry "sha256 doesn't match!"
		ERROR=1
	fi
else
	let N=$N-1
fi

if [ $N = 0 ]; then
	kdialog --icon=security-medium --error "No checksum files exist for this file."
	ERROR=1
fi

if [ $ERROR = 0 ]; then
	kdialog --icon=security-high --msgbox "Checksums match."
fi
