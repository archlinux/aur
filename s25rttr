#!/bin/bash
set -e

if [ "$LD_LIBRARY_PATH" = "" ] ; then
	export LD_LIBRARY_PATH="/usr/share/s25rttr/lib"
else
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/share/s25rttr/lib"
fi

cd /usr/
/usr/bin/s25client