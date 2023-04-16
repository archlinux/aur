#!/bin/sh

export PATH="/usr/lib/jvm/java-11-openjdk/bin:/usr/lib/jvm/java-11-jdk/bin${PATH:+":${PATH}"}"
exec java -Xmx512m -jar /usr/share/java/gcap/gcap.jar "$@"
