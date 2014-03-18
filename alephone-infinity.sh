#!/bin/sh

export ALEPHONE_DATA=/usr/share/alephone:/usr/share/alephone/scenarios/infinity

exec /usr/bin/alephone "$@"
