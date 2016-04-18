#!/bin/bash

for jar in /usr/share/java/henplus/*.jar; do
  CP="$CP:$jar"
done

for jar in ~/.henplus/jdbc/*.jar; do
  CP="$CP:$jar"
done

exec java -cp "$CP" henplus.HenPlus "$@"
