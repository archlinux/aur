#!/bin/sh
# Launcher for Akia (TÜBİTAK AKİS smart card application).
# Uses system Java; resolves libakisp11.so via java.library.path; keeps
# runtime writes inside XDG data dir (app historically writes next to jar).

set -eu

akia_data="${XDG_DATA_HOME:-$HOME/.local/share}/akia"
mkdir -p "$akia_data"
cd "$akia_data"

exec /usr/bin/java \
    -Djava.library.path=/usr/lib/akia \
    -jar /usr/share/java/akia/akia.jar \
    "$@"
