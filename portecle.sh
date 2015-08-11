#!/bin/sh

for name in /usr/share/java/portecle/*.jar; do
  CP=${CP}:$name
done

java -cp ${CP#:} net.sf.portecle.FPortecle

