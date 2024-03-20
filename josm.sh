#!/bin/sh

while true; do
    JAVA_OPTS=
    [ -f /etc/conf.d/josm ] && . /etc/conf.d/josm
    JAVA_OPTS="-Djosm.restart=true -Djava.net.useSystemProxies=true $JAVA_OPTS"

    # See https://josm.openstreetmap.de/ticket/23355
    JAVA_OPTS="$JAVA_OPTS --add-exports=java.base/sun.security.action=ALL-UNNAMED"
    JAVA_OPTS="$JAVA_OPTS --add-exports=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED"
    JAVA_OPTS="$JAVA_OPTS --add-exports=java.desktop/com.sun.imageio.spi=ALL-UNNAMED"

    java $JAVA_OPTS -jar /usr/share/java/josm/josm.jar "$@"
    [ "z$?" != "z9" ] && break
done
