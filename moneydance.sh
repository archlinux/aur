#!/bin/sh
export PATH=/usr/lib/jvm/java-11-openjdk/bin/:$PATH
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp -Dawt.useSystemAAFontSettings=on'
for name in /usr/share/java/moneydance/*.jar; do
  CP=$CP:$name
done
#/usr/lib/jvm/java-11-openjdk/bin/java -cp $CP Moneydance
java -cp $CP Moneydance
