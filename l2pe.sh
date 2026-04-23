#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre
export _JFX_EXT=/usr/share/java/l2pe/jfx/ext
export _JFX_NATIVE=/usr/share/java/l2pe/jfx/amd64

exec /usr/lib/jvm/java-8-openjdk/jre/bin/java \
    -Djava.ext.dirs="/usr/lib/jvm/java-8-openjdk/jre/lib/ext:$_JFX_EXT" \
    -Djava.library.path="$_JFX_NATIVE" \
    -jar /usr/share/java/l2pe/L2pe.jar "$@"
