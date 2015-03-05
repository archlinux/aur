#!/bin/sh

export ALEPHONE_DATA=/usr/share/alephone:/usr/share/alephone/scenarios/eternalx

exec /usr/bin/alephone "$@"
