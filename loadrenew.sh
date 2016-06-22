#!/bin/bash
shopt -s globstar

RENEW_HOME=/usr/share/java/renew
DRAWING_LOAD_CLIENT=CH.ifa.draw.application.DrawingLoadClient

printf -v CLASSPATH '%s:' $RENEW_HOME/**/*.jar
export CLASSPATH

java $DRAWING_LOAD_CLIENT $@
if [[ $? -gt 0 ]]; then
  exec renew $@
fi
