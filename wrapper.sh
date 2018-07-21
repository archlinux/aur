#!/bin/sh

# 2018-07-21: Recent builds almost always have crackling audio.
# Bypassing PulseAudio's automatic latency adjustment and specifying an explicit target latency helps... most of the time. If it doesn't work, restart once or twice.
# Number chosen by fair dice roll. (30 is too low to work at all; 500 introduces noticeable latency.)
[ "$PULSE_LATENCY_MSEC" ] || export PULSE_LATENCY_MSEC="60"

export LD_PRELOAD="/usr/lib/libcurl.so.3"
exec /usr/bin/runescape-launcher.real "$@"
