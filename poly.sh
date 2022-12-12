#!/bin/sh

ARGS=""
while [ "$1" != "" ] ; do
 ARGS="$ARGS $1"
 shift
done

exec "/usr/bin/java" $JVM_OPTS "-jar" "/usr/share/java/polylith-bin/poly.jar" $ARGS
