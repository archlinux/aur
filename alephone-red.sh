#!/bin/sh

export ALEPHONE_DATA=/usr/share/AlephOne:/usr/share/AlephOne/scenarios/red

exec /usr/bin/alephone "$@"
