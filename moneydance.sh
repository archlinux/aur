#!/bin/sh
if [ -L /usr/lib/jvm/default ]; then
    export PATH=/usr/lib/jvm/default/bin/:$PATH
else
    printf "[ ERROR ] No default Java environment available.\n"
    archlinux-java status
    printf  "\nFix your Java environment by running:\n   sudo archlinux-java set <JAVA_ENV>"
    exit 1
fi
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp -Dawt.useSystemAAFontSettings=on'
for name in /usr/share/java/moneydance/*.jar; do
  CP=$CP:$name
done
java -cp "$CP" Moneydance
