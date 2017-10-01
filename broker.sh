#!/usr/bin/env sh
RSMB_PREFIX=/usr/lib/rsmb-git
INIFILE=$(realpath $1)
cd $RSMB_PREFIX
exec ./broker $INIFILE
