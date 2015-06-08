#!/bin/sh

##
# This script will set libmatthew-java classpath variables.
##

LIBMATTHEW_HOME=/usr/share/java/libmatthew
UNIX_SOCKETS=${LIBMATTHEW_HOME}/unix.jar:${LIBMATTHEW_HOME}/debug-disable.jar:${LIBMATTHEW_HOME}/hexdump.jar
UNIX_SOCKET_DEBUG=${LIBMATTHEW_HOME}/unix.jar:${LIBMATTHEW_HOME}/debug-enable.jar:${LIBMATTHEW_HOME}/hexdump.jar

