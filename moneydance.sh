#!/bin/sh
for name in /usr/share/java/moneydance/*.jar; do
  CP=$CP:$name
done
java -cp $CP Moneydance
