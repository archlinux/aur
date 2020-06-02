#!/bin/sh

export ALEPHONE_DATA=/usr/share/AlephOne:/usr/share/AlephOne/scenarios/rubiconx

exec /usr/bin/alephone "$@"
