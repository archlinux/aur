#!/bin/sh

export ALEPHONE_DATA=/usr/share/AlephOne:/usr/share/AlephOne/scenarios/tempus_irae

exec /usr/bin/alephone "$@"
