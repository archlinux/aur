#!/bin/sh
LANG=C phymem=$(free -m | awk '/^Mem:/{print $2}')
igvmem=$(($phymem / 3))
archlinux-java-run --min 8 --max 8 -- \
  -Xmx${igvmem}m \
  -Dapple.laf.useScreenMenuBar=true \
  -Djava.net.preferIPv4Stack=true \
  -jar /usr/share/java/igv/igv.jar
