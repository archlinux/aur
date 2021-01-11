#!/bin/sh

# use java 14
# 8 suffers from an exception
# 11 doesn't show the tray icon
export PATH="/usr/lib/jvm/java-15-openjdk/jre/bin/:$PATH"

# set the home directory, class path and other java options
CP=/usr/share/java/faubox/FAUbox.jar
JAVA_MEM="-Xms64m -Xmx1g -XX:NewRatio=8 -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=20"

exec java $JAVA_MEM -Duser.home=$HOME -cp $CP de.dal33t.Start "$@"
