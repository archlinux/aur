#!/bin/sh
LANG=C phymem=$(free -m | awk '/^Mem:/{print $2}')
igvmem=$(($phymem / 3))
archlinux-java-run --min 17 --max 17 -- \
  -Xmx${igvmem}m \
  @"/usr/share/java/igv/igv.args" \
  -Dapple.laf.useScreenMenuBar=true \
  -Djava.net.preferIPv4Stack=true \
  --module-path=/usr/share/java/igv/lib \
  --module=org.igv/org.broad.igv.ui.Main "$@"
