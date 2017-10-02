#!/bin/sh

export ALEPHONE_DATA=/usr/share/AlephOne:/usr/share/AlephOne/scenarios/evil

exec /usr/bin/alephone "$@"
