#!/usr/bin/sh

if [ -z ${SWAYSOCK+x} ]; then
  export _JAVA_AWT_WM_NONREPARENTING=1
  export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd_hrgb -Dswing.aatext=true"
fi
/opt/elan/bin/ELAN_VERSIONSTRINGHERE "$@"
