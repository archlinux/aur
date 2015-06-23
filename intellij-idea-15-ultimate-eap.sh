#!/bin/sh
export IDEA_JDK=$JAVA_HOME
exec /usr/share/intellij-idea-15-ultimate-eap/bin/idea.sh "$@"
