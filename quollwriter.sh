#!/bin/sh
exec "$JAVA_HOME/bin/java" -Xmx512m -classpath /usr/share/java/quollwriter/QuollWriter.jar:/usr/share/java/quollwriter/QuollWriter-images.jar:/usr/share/java/quollwriter/QuollWriter-prompts.jar:/usr/share/java/quollwriter/QuollWriter-data.jar:/usr/share/java/quollwriter/libs/*:/usr/share/java/quollwriter/libs/docx4j/* com.quollwriter.Startup "$@"

