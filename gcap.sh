#!/bin/sh

exec env -C /usr/share/java/gcap2025 java -Xmx512m -jar /usr/share/java/gcap2025/gcap.jar "$@"
