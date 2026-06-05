#!/bin/sh

exec env -C /usr/share/java/lcar2025 java -Xmx512m -jar /usr/share/java/lcar2025/PgdAtividadeRural.jar "$@"
