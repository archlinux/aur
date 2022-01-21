#!/bin/sh

# use java 11
# 17 is not working so far
export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"

# set the home directory, class path and other java options
JAVA_MEM="-Xms64m -Xmx1g -XX:NewRatio=8 -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=20"

exec java $JAVA_MEM -Duser.home=$HOME -cp /usr/share/java/faubox/FAUbox.jar \
          de.dal33t.Start "$@"
