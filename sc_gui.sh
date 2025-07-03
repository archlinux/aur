#!/bin/sh
cd /usr/lib/spacecontrol || exit 1
java -Djava.library.path=lib -splash:sc_logo_splash.png -jar SC_GUI.jar
