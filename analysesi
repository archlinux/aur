#!/bin/sh

ANALYSE_JAR="/usr/share/analysesi/analyseSI-${ANALYSE_VER}.jar"

if [ $# -gt 1 ]
then
	echo "Usage: analysesi [foo.asi]" >&2
	exit 1
fi

if ! which java &> /dev/null
then
	echo "You need a java-runtime-environment to run analyseSI." >&2
	exit 1
fi

exec java -jar "$ANALYSE_JAR" "$@"
