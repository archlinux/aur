#!/bin/sh -e
for jar in /usr/share/java/tantrix/*.jar; do
	CP=$CP:$jar
done
OPTS=()
if [ "$1" == "-r" ]; then
	OPTS+=(reviewonly true tantrix.classname G:GamePuzzle viewerClass G:GameReviewer)
	shift
	if [ -f "$1" ]; then
		OPTS+=(serverfile "file:$1")
		shift
	fi
fi
exec /usr/bin/java -cp $CP util.JWSApplication "${OPTS[@]}" "$@"
