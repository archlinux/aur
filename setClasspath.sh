#!/bin/sh

##
# This script will set pegdown's classpath variable.
##

. /usr/share/java/parboiled/setClasspath.sh

PEGDOWN_CLASSPATH=/usr/share/java/pegdown/pegdown.jar:$PARBOILED_CLASSPATH
