#!/bin/sh
JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
PATH_TO_FX=$(echo "${JAVA_HOME}"/lib/javafx*.jar | tr ' ' ':')
cd /opt/beatoraja
exec "${JAVA_HOME}/bin/java" --module-path $PATH_TO_FX --add-modules=javafx.controls,javafx.fxml -Xms1g -Xmx4g -jar beatoraja.jar
