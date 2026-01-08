#!/bin/bash
export CLASSPATH="/usr/share/java/beads/BEADSjava.jar:$CLASSPATH"
/usr/bin/python2 /usr/bin/beads.py "$@"