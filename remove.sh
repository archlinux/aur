#!/bin/bash
cd /opt/spotify/Apps
cp xpui.spa xpui.spa.bak  # create the backup
unzip -p xpui.spa xpui.js | sed 's/{adsEnabled:\!0}/{adsEnabled:false}/' | sed 's/D&&h>=1024&&r().createElement(Pm,{onClick:T,className:Rm.Z.UpgradeButton}),//' > xpui.js
zip --update xpui.spa xpui.js
rm xpui.js

