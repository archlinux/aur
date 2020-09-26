#!/bin/sh

exec java \
    -Xmx256M \
    -DdisableUpdates='true' \
    --add-opens java.base/java.lang='ALL-UNNAMED' \
    --add-opens java.base/sun.nio.fs='ALL-UNNAMED' \
    --add-opens java.base/java.nio='ALL-UNNAMED' \
    --add-opens java.desktop/java.awt='ALL-UNNAMED' \
    --add-opens java.desktop/javax.swing='ALL-UNNAMED' \
    --add-opens java.desktop/javax.swing.plaf.basic='ALL-UNNAMED' \
    -jar /usr/share/java/muwire.jar \
    "$@"
