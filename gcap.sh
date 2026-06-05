#!/bin/sh

exec env -C /usr/share/java/gcap2023 -Xmx512m -jar /usr/share/java/gcap2023/gcap.jar "$@"
