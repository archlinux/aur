#!/bin/sh

for jar in /usr/share/java/fatcalc/*.jar; do
  CP=$CP:$jar
done

java -cp $CP net.sourceforge.fatcalc.Main
