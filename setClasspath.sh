#!/bin/sh

##
# This script will set slf4j classpath variables.
##

SLF4J_API=/usr/share/java/slf4j/slf4j-api.jar

# Binding for Jakarta Commons Logging. This binding will delegate all SLF4J logging to JCL.
SLF4J_JCL=/usr/share/java/slf4j/slf4j-jcl.jar
# Binding for java.util.logging, also referred to as JDK 1.4 logging.
SLF4J_JDK14=/usr/share/java/slf4j/slf4j-jdk14.jar
# Binding for log4j version 1.2, a widely used logging framework.
SLF4J_LOG4J12=/usr/share/java/slf4j/slf4j-log4j12.jar:/usr/share/java/log4j-1.2.15.jar
# Binding for NOP, silently discarding all logging.
SLF4J_NOP=/usr/share/java/slf4j/slf4j-nop.jar
# Binding for Simple  implementation, which outputs all events to System.err.
# Only messages of level INFO and higher are printed.
# This binding may be useful in the context of small applications.
SLF4J_SIMPLE=/usr/share/java/slf4j/slf4j-simple.jar

# See docs
SLF4J_EXT=/usr/share/java/slf4j/slf4j-ext.jar
# The SLF4J migrator is a small Java tool for migrating Java source files
# from the Jakarta Commons Logging (JCL) API to SLF4J.
SLF4J_MIGRATOR=/usr/share/java/slf4j/slf4j-migrator.jar

# To ease migration to SLF4J from JCL.
# jcl-over-slf4j.jar should not be confused with slf4j-jcl.jar.
JCL_OVER_SLF4J=/usr/share/java/slf4j/jcl-over-slf4j.jar
# JUL bridge.
# jul-to-slf4j.jar and slf4j-jdk14.jar cannot be present simultaneously.
JUL_TO_SLF4J=/usr/share/java/slf4j/jul-to-slf4j.jar
# To ease migration to SLF4J from log4j.
# log4j-over-slf4j.jar and slf4j-logj12.jar cannot be present simultaneously.
LOG4J_OVER_SLF4J=/usr/share/java/slf4j/log4j-over-slf4j.jar
