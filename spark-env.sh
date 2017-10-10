#!/usr/bin/env bash
export JAVA_HOME=/usr/lib/jvm/default-runtime
if (command -v hadoop 2> /dev/null); then
    export SPARK_DIST_CLASSPATH=$(hadoop classpath)
else
    export SPARK_DIST_CLASSPATH=""
fi
SPARK_MASTER_IP=localhost
SPARK_LOCAL_IP=localhost
