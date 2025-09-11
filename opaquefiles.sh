#!/bin/sh
exec /usr/lib/jvm/java-17-openjdk/bin/java -XX:MaxRAMPercentage=75 -jar /usr/share/java/opaquefiles.jar "$@"
