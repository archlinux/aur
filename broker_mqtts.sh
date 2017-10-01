#!/usr/bin/env sh
RSMB_PREFIX=/usr/lib/rsmb-git
cd $RSMB_PREFIX
exec ./broker_mqtts $@

