#!/bin/sh

export PATH="/usr/lib/jvm/java-17-openjdk/bin:/usr/lib/jvm/java-17-jdk/bin${PATH:+":${PATH}"}"
exec java -Xmx512m -jar /usr/share/java/irpf/irpf.jar "$@"
