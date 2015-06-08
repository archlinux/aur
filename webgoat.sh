#!/bin/sh
if [ "$(id -u)" == "0" ]; then
    echo 'You really should not run this application as root.'
    echo 'If you know what you are doing, use "java -jar /opt/webgoat/webgoat.jar" command instead.'
    exit 1
fi
/usr/bin/java -jar /opt/webgoat/webgoat.jar $@
