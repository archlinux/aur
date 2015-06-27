#!/bin/sh

if [ $# -eq 0 ] || [ "$1" = "-h" ] ; then
	cat<<EOF
Usage: ${1##*/} FOLDERS

Rename to lowercase all files found in FOLDERS if destination does not exists.

EOF
	exit
fi

if ! command -v renamelower >/dev/null 2>&1; then
	echo "'renamelower' not found in PATH. Exiting." >&2
	exit 1
fi

## Note: the -name check is not mandatory, but greatly improves the average
## performance.
for i ; do
	find "$i" -depth -name '*[[:upper:]]*' -exec renamelower {} +
done
