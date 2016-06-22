#!/bin/bash
JAR=/usr/share/java/renew/loader.jar

# default values
[[ -z $NETPATH ]] && NETPATH=.
[[ -z $CLASSPATH ]] && CLASSPATH=.

# logs home
if [[ $XDG_CACHE_HOME ]]; then
  LOGS_HOME=$XDG_CACHE_HOME/renewlogs
else
  LOGS_HOME=~/.cache/renewlogs
fi

export CLASSPATH
exec java \
  -Xmx200M \
  -Dde.renew.netPath="$NETPATH" \
  -Dde.renew.classPath="$CLASSPATH" \
  -Dlogs.home="$LOGS_HOME" \
  -jar "$JAR" \
  gui $@
