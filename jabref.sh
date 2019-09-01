#!/bin/sh

# Uncomment the line below if an unsupported default is set in archlinux-java

#export PATH=/usr/lib/jvm/java-11-openjdk/jre/bin/:$PATH
exec java -jar /usr/share/java/jabref/JabRef.jar "$@"
