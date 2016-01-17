#!/bin/sh

cd /usr/share/jstock
"$JAVA_HOME/bin/java" -Xms64m -Xmx512m -jar jstock.jar "$@"
