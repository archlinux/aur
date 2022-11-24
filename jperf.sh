#!/bin/sh
CP=/usr/share/java/jperf/jperf.jar
for name in /usr/share/java/jperf/lib/*.jar ; do
  CP=$CP:$name
done
java -cp $CP net.nlanr.jperf.JPerf
