#!/bin/bash
shopt -s globstar

RENEW_HOME=/usr/share/java/renew
STUB_GENERATOR=de.renew.call.StubGenerator

printf -v CLASSPATH '%s:' $RENEW_HOME/**/*.jar
export CLASSPATH

exec java $STUB_GENERATOR $@
