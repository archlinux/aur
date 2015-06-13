#!/bin/sh
exec /usr/bin/java $JVM_OPTS -jar /usr/share/java/picard-tools/picard.jar "$@"
