#!/bin/bash
shopt -s globstar

RENEW_HOME=/usr/share/java/renew
STUB_COMPILER=de.renew.call.StubCompiler

printf -v CLASSPATH '%s:' $RENEW_HOME/**/*.jar
export CLASSPATH

exec java $STUB_COMPILER $@
