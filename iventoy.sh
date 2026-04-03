#!/bin/sh

cd /opt/iventoy || exit 1
exec ./iventoy.sh "$@"
