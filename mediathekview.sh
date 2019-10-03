#!/bin/sh -e
JAVAPATH="/usr/lib/jvm/java-11-openjdk/bin"
[ -d "$JAVAPATH" ] && export PATH="$JAVAPATH":$PATH
exec java -Xmx1G -jar /opt/mediathek/MediathekView.jar "$@"
