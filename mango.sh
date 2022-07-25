#!/usr/bin/env bash

## Set JRE ##
export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH

## Launch Application ##
exec java -Xms64M -Xmx2000M -XX:MaxDirectMemorySize=8g -jar /opt/mango/Mango.jar "$@"
