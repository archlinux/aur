#!/usr/bin/env bash
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
/opt/nutch/bin/nutch nutchserver