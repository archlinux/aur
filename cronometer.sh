#!/bin/sh

for jar in /usr/share/java/cronometer/*.jar; do
  CP=$CP:$jar
done

java -cp $CP ca.spaz.cron.CRONOMETER
