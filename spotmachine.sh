#!/bin/sh
cd /usr/share/java/spotmachine
exec java -cp lib/resources/gettext-commons-0.9.6.jar:.:lib main.SpotMachine "$@"
