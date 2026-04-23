#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre
exec /usr/lib/jvm/java-8-openjdk/jre/bin/java -jar /usr/share/java/l2pe/L2pe.jar "$@"
