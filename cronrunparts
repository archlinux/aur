#!/bin/bash

# run-parts - concept taken from Debian

# keep going when something fails
set +e

if [ $# -lt 1 ]; then
	echo "Usage: run-parts <dir>"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "Not a directory: $1"
	exit 1
fi

# Ignore *~ and *, scripts
for i in $1/*[^~,] ; do
	[ -d $i ] && continue
	# Don't run *.{pacsave,pacorig,pacnew,swp} scripts
	[ "${i%.pacsave}" != "${i}" ] && continue
        [ "${i%.pacorig}" != "${i}" ] && continue
        [ "${i%.pacnew}" != "${i}" ] && continue
        [ "${i%.swp}" != "${i}" ] && continue
	[ "${i%,v}" != "${i}" ] && continue

	if [ -x $i ]; then
		$i 2>&1 | awk -v "progname=$i" \
			      'progname {
				   print progname ":\n"
				   progname="";
			       }
			       { print; }'
	fi
done

exit 0
