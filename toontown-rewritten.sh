#!/bin/bash

# Launch
mkdir -p ~/.toontown-rewritten
cd ~/.toontown-rewritten
exec /opt/toontown-rewritten/Launcher &
while [ ! -f TTREngine ]
do
  sleep 2
done

chmod +x TTREngine
