#!/bin/sh

exec env -C /usr/share/java/lcar2024 java -Xmx512m -jar /usr/share/java/lcar2024/PgdAtividadeRural.jar "$@"
