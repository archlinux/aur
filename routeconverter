#!/bin/sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/routeconverter

java=`which java`
java_opts=""

cpu=`uname -m`

jar="/usr/lib/routeconverter/RouteConverterLinux.jar"
[ "$cpu" == "x86_64" ] && jar="/usr/lib/routeconverter/RouteConverterLinux64.jar"

"$java" $java_opts -jar "$jar" $@
