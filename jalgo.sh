#!/bin/sh

cd /usr/lib/jalgo \
    && exec java \
        -Dawt.useSystemAAFontSettings=gasp \
        -jar org.jalgo-0.0.1-SNAPSHOT-shaded.jar \
        "$@"
