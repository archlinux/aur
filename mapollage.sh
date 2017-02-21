#!/bin/sh
if ! /usr/bin/java -version 2>&1 | grep 'version "1.8' >/dev/null
then
	echo "mapollage requires Java 8" >&2
	exit 1
fi

#unset JAVA_TOOL_OPTIONS
exec /usr/bin/java -jar '/usr/share/java/mapollage/mapollage.jar' "$@"

