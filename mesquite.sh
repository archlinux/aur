#!/bin/sh

cd /usr/share/mesquite
"$JAVA_HOME/bin/java" -Djava.library.path=lib -Djri.ignore.ule="yes" -cp . mesquite.Mesquite "$@"
