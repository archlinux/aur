#!/bin/sh

export DOOMTOOLS_PATH="/usr/share/doomtools"
export DOOMTOOLS_JAR="/usr/share/java/doomtools/doomtools.jar"
java -cp $DOOMTOOLS_JAR -Xms64M -Xmx4G MAINCLASS_PLACEHOLDER "$@"
