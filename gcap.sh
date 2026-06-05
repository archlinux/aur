#!/bin/sh

exec env -C /usr/share/java/gcap2024 java -Xmx512m -jar /usr/share/java/gcap2024/gcap.jar "$@"
