#!/bin/sh

cd /usr/share/java/tvbrowser/
/usr/bin/archlinux-java-run --min 8 --max 8 -- -jar tvbrowser.jar "$@"
