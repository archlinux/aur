#!/bin/sh

# use java 11
# 8 suffers from an exception
# 16 suffers from an error
export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"

# set the home directory, class path and other java options
CP=/usr/share/java/faubox/FAUbox.jar
JAVA_MEM="-Xms64m -Xmx1g -XX:NewRatio=8 -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=20"

exec java $JAVA_MEM -Duser.home=$HOME -cp $CP de.dal33t.Start "$@"
