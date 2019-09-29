#!/bin/sh

cd /usr/share/java/tvbrowser/
/usr/bin/archlinux-java-run --min 11 -- -Xms16m -Xmx1G --module-path="lib:tvbrowser.jar" -Djava.library.path="/usr/share/java/tvbrowser" -splash:imgs/splash.png -Dpropertiesfile=linux.properties -m tvbrowser/tvbrowser.TVBrowser "$@"
