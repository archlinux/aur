#!/bin/sh
exec "$JAVA_HOME/bin/java" -cp '/usr/share/java/quollwriter/*:/usr/share/java/quollwriter/docx4j/*' com.quollwriter.Startup "$@"
