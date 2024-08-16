#!/bin/sh
cd /usr/share/xmage/mage-server

java -Xms256M -Xmx512M -Dfile.encoding=UTF-8 -Djava.security.policy=./config/security.policy -Dlog4j.configuration=file:./config/log4j.properties -jar /usr/share/xmage/mage-server/lib/mage-server-1.4.50.jar
