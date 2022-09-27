#!/bin/sh
# source application-specific settings
while true; do
    JOSM_ARGS=
    [ -f /etc/conf.d/josm ] && . /etc/conf.d/josm
    CLASSPATH="/usr/share/java/josm/josm.jar"
    java ${JOSM_ARGS} -cp "${CLASSPATH}" -Djosm.restart=true org.openstreetmap.josm.gui.MainApplication "$@"
    [ $? -eq 9 ] || break
done
