#!/bin/sh

exec java \
    -Xms256M \
    -XX:+HeapDumpOnOutOfMemoryError \
    -XX:+ExitOnOutOfMemoryError \
    -DdisableUpdates='true' \
    --add-opens java.base/java.lang='ALL-UNNAMED' \
    --add-opens java.base/java.nio='ALL-UNNAMED' \
    --add-opens java.base/sun.nio.fs='ALL-UNNAMED' \
    --add-opens java.desktop/com.sun.java.swing.plaf.gtk='ALL-UNNAMED' \
    --add-opens java.desktop/java.awt='ALL-UNNAMED' \
    --add-opens java.desktop/javax.swing='ALL-UNNAMED' \
    --add-opens java.desktop/javax.swing.plaf.basic='ALL-UNNAMED' \
    --add-opens java.desktop/javax.swing.text.html='ALL-UNNAMED' \
    --add-opens java.desktop/sun.swing='ALL-UNNAMED' \
    -jar /usr/share/java/muwire.jar \
    "$@"
