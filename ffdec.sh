#!/bin/sh

DEFAULT_JVM_OPTS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
eval set -- $DEFAULT_JVM_OPTS -cp /usr/share/java/ffdec-git/lib  -jar '/usr/share/java/ffdec-git/ffdec.jar' "$@"
exec java "$@"
