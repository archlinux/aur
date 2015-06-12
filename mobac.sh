#!/bin/sh

# This file will start the Mobile Atlas Creator with custom memory settings for
# the JVM. With the below settings the heap size (Available memory for the application)
# will range from 64 megabyte up to 512 megabyte.
cd /usr/share/mobac/
java -Xms64m -Xmx512M -jar Mobile_Atlas_Creator.jar
