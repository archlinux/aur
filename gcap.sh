#!/bin/sh

exec env -C /usr/share/java/gcap java -Xmx512m -jar /usr/share/java/gcap/gcap.jar "$@"
