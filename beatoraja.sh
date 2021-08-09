#!/bin/sh
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
cd /opt/beatoraja
exec java -Xms1g -Xmx4g -jar beatoraja.jar
