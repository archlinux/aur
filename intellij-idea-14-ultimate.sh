#!/bin/sh
export IDEA_JDK=$JAVA_HOME
exec /usr/share/intellij-idea-14-ultimate/bin/idea.sh "$@"
