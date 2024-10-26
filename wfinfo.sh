#!/bin/sh

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	cat <<-EOF
		##### Wrapper #####
		- expects \$1 to be the log location (or -h/--help),
		   so options must be passed after that
		 - will find a log location with \`locate\` if it's
		    not at \$1 or the default location
		- creates a cache directory under ~/.cache/
		   instead of the binary's default of /tmp/
		 - configurable via environment variable TMPDIR
		- btw WFINFO_LOG={off, error, warn, info, debug,
		   trace} changes the loglevel of the binary
		##### Binary #####
	EOF
	exec wfinfo-ng "$1"
fi

##### cache setup #####
: ${TMPDIR:=~/.cache/wfinfo-ng}
mkdir -pv "$TMPDIR" >&2
#######################

### EE.log location ###
# first parameter?
logloc="$1"; [ "$#" -ge 1 ] && shift
logloc="${logloc:-$(
# set in cachedir?
cat -- "$TMPDIR/EElogloc" 2>&- ||
# locatable?
{ locate --version >&- &&
echo finding EE.log with most recent modification time... >&2 &&
locate \*/Warframe/EE.log -0 |
xargs -r0 stat --printf '%Y %n\0' |
sort -rnz | head -zn 1 | cut -zd ' ' -f 2- | tr \\0 \\n
}
)}"
if ! [ "$logloc" ]; then
	echo No EE.log location '($1)', using default... >&2
	logloc="$HOME/.local/share/Steam/steamapps/compatdata/230410/pfx/drive_c/users/steamuser/AppData/Local/Warframe/EE.log"
fi
if ! [ -r "$logloc" ]; then
	echo Invalid or unreadable EE.log location \""$logloc"\", exiting... >&2
	exit 4
fi
printf %s\  Storing EE.log location = >&2 &&
printf %s\\n "$logloc" | tee "$TMPDIR/EElogloc"
#######################

# valid WFINFO_LOG values are: error, warn, info, debug, trace, off
WFINFO_LOG="${WFINFO_LOG:-warn}" TMPDIR="$TMPDIR" exec wfinfo-ng "$logloc" "$@"
