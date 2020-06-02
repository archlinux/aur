#!/bin/sh

export ALEPHONE_DATA=/usr/share/AlephOne:/usr/share/AlephOne/scenarios/phoenix

exec /usr/bin/alephone "$@"
