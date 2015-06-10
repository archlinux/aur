#!/bin/sh
VERSION=0.9.93
XLOGO_HOME=/usr/share/xlogo
cd "$XLOGO_HOME"
java -jar "$XLOGO_HOME/xlogo-$VERSION.jar" "$@"
