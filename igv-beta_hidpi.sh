#!/bin/sh
LANG=C phymem=$(free -m | awk '/^Mem:/{print $2}')
igvmem=$(($phymem / 3))
archlinux-java-run --min 21 --max 21 -- \
  -Xmx${igvmem}m \
  @"/usr/share/java/igv-beta/igv.args" \
  -Dsamjdk.snappy.disable=true \
  -Dapple.laf.useScreenMenuBar=true \
  -Djava.net.preferIPv4Stack=true \
  -Djava.net.useSystemProxies=true \
  -Dsun.java2d.uiScale=2 \
  -cp "/usr/share/java/igv-beta/lib/*" \
  org.igv.ui.Main "$@"
