#! /bin/bash

if [ ! -d "$HOME"/.ut2004 ] ; then
   mkdir -p "$HOME"/.ut2004/System
   cp /opt/ut2004/__support/app/System/* "$HOME"/.ut2004/System/
   grep -FB1 CDKey /opt/ut2004/goggame-1207658691.script | grep -Po '"valueData": "\K[A-Z0-9-]*(?=",)' > "$HOME"/.ut2004/System/CDkey
   chmod 600 "$HOME"/.ut2004/System/CDkey
fi
cd /opt/ut2004/System
./ut2004-bin
