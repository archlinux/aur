#!/bin/bash

BOOTDIRS="/usr/lib/apollo"
CLASSPATH="$BOOTDIRS/apollo-boot.jar"

if [ -z "$JVM_FLAGS" ] ; then
	JVM_FLAGS="-server -Xmx1G -XX:-UseBiasedLocking"
fi

if [ "$APOLLO_ASSERTIONS" != "false" ] ; then
	JVM_FLAGS="-ea $JVM_FLAGS"
fi

if [ "x$APOLLO_OPTS" != "x" ] ; then
	JVM_FLAGS="$JVM_FLAGS $APOLLO_OPTS"
fi

# Optionally enable remote debugging
if [ "x$APOLLO_DEBUG" != "x" ]; then
	JVM_FLAGS="$JVM_FLAGS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
fi

# Optionally enable YourKit debugging
if [ "x$APOLLO_PROFILE" != "x" ]; then
	JVM_FLAGS="-agentlib:yjpagent $JVM_FLAGS"
fi

if [ -z "$JMX_OPTS" ] ; then
	JMX_OPTS="-Dcom.sun.management.jmxremote"
fi

JVM_FLAGS="$JVM_FLAGS $JMX_OPTS"

SYSTEM_PROPS="$SYSTEM_PROPS -Dapollo.home=$APOLLO_HOME"
if [ ! -z "$APOLLO_BASE" ] ; then
	SYSTEM_PROPS="$SYSTEM_PROPS -Dapollo.base=$APOLLO_BASE"
fi

# Attempt to bump up the ulimit
ulimit -n 100000 > /dev/null 2> /dev/null

exec -a apollo java $JVM_FLAGS $SYSTEM_PROPS -classpath "$CLASSPATH" org.apache.activemq.apollo.boot.Apollo "$BOOTDIRS" org.apache.activemq.apollo.cli.Apollo "$@"
