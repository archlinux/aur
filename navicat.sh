#!/bin/bash
export LD_PRELOAD="/usr/lib/libsystemd.so.0${LD_PRELOAD:+:$LD_PRELOAD}"
exec /opt/navicat17-premium-cs/AppRun "$@"
