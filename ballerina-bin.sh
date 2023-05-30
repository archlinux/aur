#!/bin/bash
# JAVA 11
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
exec /opt/ballerina/bin/bal "$@"
