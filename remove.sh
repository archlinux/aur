#!/bin/bash
cd /opt/spotify/Apps
cp xpui.spa xpui.spa.bak  # create the backup
unzip -p xpui.spa xpui.js | sed 's/{adsEnabled:\!0}/{adsEnabled:false}/' | sed 's/B&&f>=1024&&u().createElement(bF,{spec:I,onClick:P,className:kL.Z.UpgradeButton}),//' > xpui.js
zip --update xpui.spa xpui.js
rm xpui.js

