#!/bin/sh

exec env -C /usr/share/java/lcar java -Xmx512m -jar /usr/share/java/lcar/PgdAtividadeRural.jar "$@"
