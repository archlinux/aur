#!/bin/sh

mkdir -p ~/rundeck
cp -u /usr/share/java/rundeck/rundeck-launcher.jar ~/rundeck

cd ~/rundeck
java -XX:MaxPermSize=256m -Xmx1024m -Xms256m -server -jar rundeck-launcher.jar
