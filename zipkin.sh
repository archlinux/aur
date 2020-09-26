#!/bin/bash

ZIPKIN_ENV=/etc/zipkin/zipkin-env.sh
if [[ -e $ZIPKIN_ENV ]]
then
    source $ZIPKIN_ENV
fi

java -jar /usr/share/java/zipkin/zipkin.jar

