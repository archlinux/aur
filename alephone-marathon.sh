#!/bin/sh

export ALEPHONE_DATA=/usr/share/alephone:/usr/share/alephone/scenarios/marathon

exec /usr/bin/alephone "$@"
