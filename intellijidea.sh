#!/bin/sh
[[ "$IDEA_JDK" == "" ]] && IDEA_JDK=$JAVA_HOME
export IDEA_JDK
exec /usr/share/intellij-idea-ultimate-edition/bin/idea.sh "$@"
