#!/bin/sh

SCRIPTNAME=$(basename $0)

mem=1536  # megabytes
stack=256 # megabytes

function usageExit {
	printf "usage: %s [-m memsize] [-s stacksize]\n" "$SCRIPTNAME"
	printf "       (sizes in megabytes)\n"
	exit 1
}

while [ $# -gt 0 ]; do
	if [ "x$1" = "x-m" ]; then
		shift
		if [ $# -eq 0 ]; then usageExit; fi
		mem=$1
	elif [ "x$1" = "x-s" ]; then
		shift
		if [ $# -eq 0 ]; then usageExit; fi
		stack=$1
	else
		usageExit
	fi
	shift
done

exec java -Xmx${mem}m -Xms${stack}m -jar /opt/gprojector/G.Projector.jar
