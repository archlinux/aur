#!/bin/sh
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp -Dawt.useSystemAAFontSettings=on'
for name in /usr/share/java/moneydance/*.jar; do
  CP=$CP:$name
done
java -cp $CP Moneydance
