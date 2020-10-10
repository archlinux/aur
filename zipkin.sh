#!/bin/sh

ZIPKIN_ENV=/etc/zipkin/zipkin-env.sh
if [[ -e $ZIPKIN_ENV ]]
then
    source $ZIPKIN_ENV
fi

JVM_OPTIONS="-Xmx${JVM_XMX:=512M} -Xms${JVM_XMS:=512M} $ZIPKIN_JVM_OPTIONS"

java $JVM_OPTIONS -jar /usr/share/java/zipkin/zipkin.jar

