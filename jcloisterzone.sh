#!/bin/sh
cd /usr/share/JCloisterZone/

export PATH=/usr/lib/jvm/java-8-jdk/bin:/usr/lib/jvm/java-8-openjdk/jre/bin:$PATH
java -jar JCloisterZone.jar "$@"
