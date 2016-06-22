#!/bin/bash
shopt -s globstar

RENEW_HOME=/usr/share/java/renew

printf -v CLASSPATH '%s:' $RENEW_HOME/**/*.jar
export CLASSPATH

exec javac $@
