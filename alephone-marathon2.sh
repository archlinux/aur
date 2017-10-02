#!/bin/sh

export ALEPHONE_DATA=/usr/share/AlephOne:/usr/share/AlephOne/scenarios/marathon2

exec /usr/bin/alephone "$@"
