#!/bin/sh
TNOODLEPATH="/usr/share/tnoodlecli"
exec /usr/bin/java -jar '${TNOODLEPATH}/tnoodle.jar' "$@"
