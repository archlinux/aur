#!/bin/sh
exec java -jar /usr/share/java/packwiz/packwiz-installer-bootstrap.jar --bootstrap-no-update --bootstrap-main-jar /usr/share/java/packwiz/packwiz-installer.jar "$@"
