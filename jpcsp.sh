#!/bin/sh
mkdir -p ~/.jpcsp
cd ~/.jpcsp

if [ `uname -m` == x86_64 ] ; then
    export LD_LIBRARY_PATH=/opt/jpcsp/lib/linux-amd64:/opt/java/jre/lib/amd64:/usr/lib/jvm/java-6-openjdk/jre/lib/amd64:/usr/lib/jvm/java-7-openjdk/jre/lib/amd64
  else
    export LD_LIBRARY_PATH=/opt/jpcsp/lib/linux-x86:/opt/java/jre/lib/i386:/usr/lib/jvm/java-6-openjdk/jre/lib/i386:/usr/lib/jvm/java-7-openjdk/jre/lib/i386
fi
java -jar "/opt/jpcsp/bin/jpcsp.jar"
