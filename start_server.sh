#!/bin/bash

cd /srv/craftbukkit
sleep 3650d | sudo -u craftbukkit /usr/bin/java -jar -Xmx1G /srv/craftbukkit/$1.jar &
echo $! > /var/run/$1.pid
