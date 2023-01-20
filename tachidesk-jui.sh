#!/bin/sh

java=$(archlinux-java status | awk -F '-' 'NR>1 { gsub(/ /,""); gsub("\\(default)",""); if($2 >= 17) print }' | head -n1)

if [ "$java" = "" ]; then
    echo "no java >= 17 installation found! please intall one."
    exit 1
fi

path="/usr/lib/jvm/$java/bin/java"

exec $path -jar /usr/share/java/tachidesk-jui/tachidesk-jui.jar "$@"
