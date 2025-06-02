#!/bin/bash
cd /opt/spotify/Apps
cp xpui.spa xpui.spa.bak  # create the backup
unzip -p xpui.spa xpui-snapshot.js | sed 's/adsEnabled:\!0/adsEnabled:false/' > xpui-snapshot.js
zip --update xpui.spa xpui-snapshot.js
rm xpui-snapshot.js

