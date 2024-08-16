#!/bin/sh
cd /usr/share/xmage/mage-client

java -Xms256m -Xmx2048m -Dfile.encoding=UTF-8 -jar /usr/share/xmage/mage-client/lib/mage-client-1.4.50.jar &
