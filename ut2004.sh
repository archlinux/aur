#! /bin/bash

if [ ! -d "$HOME"/.ut2004 ] ; then
   mkdir -p "$HOME"/.ut2004/System
   cp /opt/ut2004/__support/app/System/* "$HOME"/.ut2004/System/
fi
cd /opt/ut2004/System
./ut2004-bin
