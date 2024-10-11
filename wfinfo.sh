#!/bin/sh
# technically this could be as simple as 'cd /tmp;wfinfo-update;wfinfo-ng' if your warframe compat data is at the default path

##### cache setup #####
: ${WFINFO_CACHEDIR:=~/.cache/wfinfo-ng}
mkdir -pv "$WFINFO_CACHEDIR" >&2
cd "$WFINFO_CACHEDIR" || { echo Could not enter cache directory, exiting... >&2; exit 1; }
#######################

### EE.log location ###
# first parameter?
logloc="$1"; [ "$#" -ge 1 ] && shift
logloc="${logloc:-$(
# set in cachedir?
cat "$WFINFO_CACHEDIR/EElogloc" 2>&- ||
# locatable?
{ locate --version >&- &&
echo finding EE.log with most recent modification time... >&2 &&
locate \*/Warframe/EE.log |
xargs -rd \\n stat -c '%Y %n' |
sort -rn | head -n 1 | cut -d ' ' -f 2-
}
)}"
if ! [ "$logloc" ]; then
	echo No EE.log location '($1)', using default...
	logloc="$HOME/.local/share/Steam/steamapps/compatdata/230410/pfx/drive_c/users/steamuser/AppData/Local/Warframe/EE.log"
fi
if ! [ -r "$logloc" ]; then
	echo Invalid or unreadable EE.log location \""$logloc"\", exiting... >&2
	exit 4
fi
printf %s\\n "$logloc" > "$WFINFO_CACHEDIR/EElogloc" && echo Storing EE.log location... >&2
#######################

###### json data ######
wfinfo-update ||
if [ -f "$WFINFO_CACHEDIR/filtered_items.json" ] && [ -f "$WFINFO_CACHEDIR/prices.json" ]; then
	echo Update failed, continuing... >&2
else
	echo Update failed and no cached price info, exiting... >&2
	exit 2
fi
#######################

# valid WFINFO_LOG values are: error, warn, info, debug, trace, off
WFINFO_LOG="${WFINFO_LOG:-warn}" exec wfinfo-ng "$logloc" "$@"
