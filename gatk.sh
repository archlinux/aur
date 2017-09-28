#!/bin/sh
exec /usr/bin/java $JVM_OPTS -jar /usr/share/java/gatk/GenomeAnalysisTK.jar "$@"
