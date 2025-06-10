#!/bin/sh

export DOOMTOOLS_PATH="/usr/share/doomtools"
export DOOMTOOLS_JAR="/usr/share/java/doomtools/doomtools-PKGVER_PLACEHOLDER.jar"
exec /usr/bin/java -cp "$DOOMTOOLS_JAR" -Xms64M -Xmx4G MAINCLASS_PLACEHOLDER "$@"
