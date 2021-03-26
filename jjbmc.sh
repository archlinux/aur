#!/bin/sh
export PATH="/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH"
java -jar /usr/share/java/jjbmc/jjbmc.jar "$@"
