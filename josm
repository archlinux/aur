#!/bin/sh

JOSM_ARGS=""
JAWS_ARGS=""
JAWSFILE="/usr/share/java/josm/josm.jnlp"

[ -f /etc/conf.d/josm ] && . /etc/conf.d/josm

for a in ${JOSM_ARGS}; do
	JAWS_ARGS="$JAWS_ARGS -J${a}"
done

while [ $# -gt 0 ]; do
	JAWS_ARGS="$JAWS_ARGS -arg \"$1\""
	shift
done

eval "javaws ${JAWS_ARGS} ${JAWSFILE}"
