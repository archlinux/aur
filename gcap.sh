#!/bin/sh

export PATH="/usr/lib/jvm/java-11-openjdk/bin:/usr/lib/jvm/java-11-jdk/bin${PATH:+":${PATH}"}"
exec env -C /usr/share/java/gcap2022 java -Xmx512m -jar /usr/share/java/gcap2022/gcap.jar "$@"
