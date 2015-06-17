#!/bin/sh

# vdr-moveto.sh -- simple script for moving recordings to folders
# Ville Skyttä 2007, Public Domain
#
# The preferred way to use this script is through VDR's recording commands
# menu.  To do that, add entries eg. like these to /etc/vdr/reccmds.conf:
#
# Move to movies: vdr-moveto.sh 00_Movies
# Move to music: vdr-moveto.sh 00_Music

videodir="$(sed -ne 's/^\s*VDR_OPTIONS\s*=.*\(-v\s\+\|--video\(=\|\s\+\)\)\([^[:space:])]*\).*/\3/p' /etc/vdr/vdr)"
[ -n "$videodir" ] || videodir="/var/lib/vdr/video"

to="$videodir/$1"
what="$2"
if [ -z "$what" ] ; then
    echo "Usage: $0 TO-DIR WHAT"
    exit 1
fi

mkdir -p "$to"
dir="$(dirname $what)"
todir="$to/$(basename $dir)"
if [ -d "$todir" ] ; then
    mv -v "$what" "$todir"
    rmdir -v "$dir"
else
    mv -v "$dir" "$to"
fi

touch "$videodir/.update"
