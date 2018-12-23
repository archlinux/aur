#!/bin/sh
for name in /usr/share/java/legerdemain/*.jar ; do
  CP=$CP:$name
done
exec /usr/bin/java -cp $CP legerd.TheApp
