#!/bin/bash
shopt -s globstar

RENEW_HOME=/usr/share/java/renew
MAIN_CLASS=de.renew.io.exportcli.Export

printf -v CLASSPATH '%s:' $RENEW_HOME/**/*.jar
export CLASSPATH

exec java $MAIN_CLASS $@
