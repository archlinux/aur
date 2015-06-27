#!/bin/sh

if [ $# -eq 0 ] || [ "$1" = "-h" ] ; then
	cat<<EOF
Usage: ${1##*/} FILES

Rename FILES to lowercase if destination does not exist.

EOF
	exit
fi

for f ; do
	filename=${f##*/}

	case "$f" in
	*/*) dirname="${f%/*}" ;;
	*) dirname="." ;;
	esac

	nf="$(echo "$filename" | awk '{print tolower($0)}')"
	newname="${dirname}/${nf}"
	mv -nv "$f" "$newname" 2>/dev/null
done
