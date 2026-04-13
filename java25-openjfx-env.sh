#!/usr/bin/env sh

export OPENJFX_MODULES_PATH='/usr/lib/jvm/java-25-openjfx/lib'
export OPENJFX_LIBRARY_PATH='/usr/lib/jvm/java-25-openjfx/lib'
export OPENJFX_JAVA_OPTIONS="-Djava.library.path=$OPENJFX_LIBRARY_PATH --module-path=$OPENJFX_MODULES_PATH"
