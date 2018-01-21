#!/bin/sh -e

cd /usr/share/edisyn
exec java -jar edisyn.jar "$@"
