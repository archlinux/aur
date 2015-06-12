#!/bin/sh

cd /usr/share/java/raccoon/
exec java -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -jar raccoon-latest.jar "$@"
exit $?
