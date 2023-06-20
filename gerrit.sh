#!/bin/sh

set -eu

if [ "${USER-}" != gerrit ]; then
  echo >&2 "please run $0 as user gerrit"
  exit 1
fi

GERRIT_SITE=/var/lib/gerrit
export GERRIT_SITE

exec /usr/bin/java -jar /usr/share/java/gerrit/gerrit.war "$@"
