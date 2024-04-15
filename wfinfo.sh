#!/bin/sh
CACHEDIR=~/.cache/wfinfo-ng
mkdir -pv "$CACHEDIR"
cd "$CACHEDIR" || { echo Could not enter cache directory, exiting...; exit 1; }
wfinfo-update ||
if [ -f "$CACHEDIR/filtered_items.json" ] && [ -f "$CACHEDIR/prices.json" ]; then
	echo Update failed, continuing...
else
	echo Update failed and no cached price info, exiting...
	exit 1
fi
# wfinfo-ng will create multiple PNG files in $PWD
# this would delete them, but we've already got a cache directory anyway
#cleanup(){ echo Exit; rm ./*.png; exit 130; }; trap cleanup INT
exec wfinfo-ng "${1-$(
# EE.log location set manually in cachedir?
cat "$CACHEDIR/EElogloc" 2>&- ||
# find EE.log with most recent modification time
locate \*/Warframe/EE.log |
xargs -rd \\n stat -c '%Y %n' |
sort -n | tail -n 1 | cut -d ' ' -f 2-
)}"
