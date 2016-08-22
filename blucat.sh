#!/bin/sh
exec /usr/bin/java -cp /usr/share/java/blucat/blucat.jar:/usr/share/java/blucat/bluecove-2.1.1-SNAPSHOT.jar blucat.Main  "$@"
