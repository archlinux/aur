#!/bin/sh

export ALEPHONE_DATA=/usr/share/alephone:/usr/share/alephone/scenarios/marathon2

exec /usr/bin/alephone "$@"
