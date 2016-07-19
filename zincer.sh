#!/bin/bash

[[ $ZINC_HOME ]]    || ZINC_HOME=/opt/zinc
[[ $ZINC_PORT ]]    || ZINC_PORT=3030
[[ $ZINC_TIMEOUT ]] || ZINC_TIMEOUT=0

[[ $JAVA_EXEC ]]  || JAVA_EXEC=java
[[ $JAVA_META ]]  || JAVA_META=512m
[[ $JAVA_HEAP ]]  || JAVA_HEAP=1024m
[[ $JAVA_CODE ]]  || JAVA_CODE=256m
[[ $JAVA_STACK ]] || JAVA_STACK=1m

COMMAND="\
\
$JAVA_EXEC \
\
-server \
-XX:+UseG1GC \
-XX:+DoEscapeAnalysis \
-XX:+UseCompressedOops \
-XX:+UseCompressedClassPointers \
-XX:+HeapDumpOnOutOfMemoryError \
-XX:InitialHeapSize=$JAVA_HEAP \
-XX:MaxHeapSize=$JAVA_HEAP \
-XX:ThreadStackSize=$JAVA_STACK \
-XX:MetaspaceSize=$JAVA_META \
-XX:MaxMetaspaceSize=$JAVA_META \
-XX:InitialCodeCacheSize=$JAVA_CODE \
-XX:ReservedCodeCacheSize=$JAVA_CODE \
\
-Djava.net.preferIPv4Stack=true \
$JAVA_OPTS \
\
-Dzinc.home=$ZINC_HOME \
-classpath $ZINC_HOME/lib/*:. \
com.typesafe.zinc.Nailgun \
$ZINC_PORT $ZINC_TIMEOUT $ZINC_OPTS \
"

exec $COMMAND
