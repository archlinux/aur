#!/bin/sh

export ALEPHONE_DATA=/usr/share/alephone:/usr/share/alephone/scenarios/evil

exec /usr/bin/alephone "$@"
