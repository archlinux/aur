#!/bin/sh

# WARNING:
# Running IntelliJ IDEA with java other than java 11
# may cause various problems, such as Graddle import not working
if [ -z "$IDEA_JDK" ] ; then
  IDEA_JDK="/usr/lib/jvm/java-11-openjdk/"
fi
exec env IDEA_JDK="$IDEA_JDK" /usr/share/idea/bin/idea.sh "$@"

# vim: ts=2 sw=2 et:
