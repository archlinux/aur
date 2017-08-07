#!/usr/bin/env bash

export JAVA_HOME=/usr/lib/jvm/default-runtime
export SPARK_DIST_CLASSPATH=$(hadoop classpath)
SPARK_MASTER_IP=localhost
SPARK_LOCAL_IP=localhost
