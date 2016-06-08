#!/bin/sh
export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
exec /usr/bin/java -jar '/usr/share/java/cryptomator/cryptomator.jar' "$@"
