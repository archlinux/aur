#!/bin/bash

cd /srv/craftbukkit
sleep 3650d | /usr/bin/java -jar -Xmx1G /srv/craftbukkit/$1.jar &
echo $! > /run/craftbukkit/$1.pid
