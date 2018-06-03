#!/bin/sh

while true; do
    JAVA_OPTS=
    [ -f /etc/conf.d/josm ] && . /etc/conf.d/josm
    JAVA_OPTS="-Djosm.restart=true -Djava.net.useSystemProxies=true $JAVA_OPTS"

    java $JAVA_OPTS -jar /usr/share/java/josm/josm.jar "$@"
    [ "z$?" != "z9" ] && break
done
