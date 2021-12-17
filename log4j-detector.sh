#!/bin/sh
export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
exec java -jar '/usr/share/java/log4j-detector/log4j-detector.jar' "$@"
