#!/usr/bin/env sh
source java-openjfx-env
java $OPENJFX_JAVA_OPTIONS --add-modules javafx.swing,javafx.media,javafx.web,javafx.graphics -Xmx1200m -DuseDesktop=true -jar /usr/lib/jalbum/JAlbum.jar
