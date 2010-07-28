#!/bin/bash

cd "/opt/quake2"
./q2ded +set basedir /opt/quake2 $*
exit $?

