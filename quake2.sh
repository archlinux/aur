#!/bin/bash

cd "/opt/quake2"
./sdlquake2 +set vid_ref glx +set basedir /opt/quake2 $*
exit $?

