#!/bin/sh
exec /usr/bin/java \
    -server \
    -DopenfireHome=/var/lib/openfire \
    -Dopenfire.lib.dir=/usr/share/java/openfire \
    -Dlog4j.configurationFile=/usr/share/java/openfire/log4j2.xml \
    -Dlog4j2.formatMsgNoLookups=true \
    -Djdk.tls.ephemeralDHKeySize=matched \
    -Djsse.SSLEngine.acceptLargeFragments=true \
    -classpath /usr/share/java/openfire/startup.jar \
    -jar /usr/share/java/openfire/startup.jar \
    "$@"
