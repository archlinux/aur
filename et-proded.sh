#!/bin/sh
cd /usr/share/enemy-territory
./etded.x86 +set dedicated 2 +set fs_game etpro +exec server.cfg $*
