#!/bin/bash

cd "/opt/quake2"
./sdlquake2 +set basedir /opt/quake2 +set game ctf +set dedicated 1 $*
exit $?

