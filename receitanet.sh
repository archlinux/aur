#!/bin/sh

export PATH="/usr/lib/jvm/java-11-openjdk/bin:/usr/lib/jvm/java-11-jdk/bin${PATH:+":${PATH}"}"
exec java \
    -Xmx512m \
    --add-exports jdk.crypto.mscapi/sun.security.mscapi=ALL-UNNAMED \
    --add-opens=java.base/java.security=ALL-UNNAMED \
    -jar /usr/share/java/receitanet/receitanet.jar "$@"
