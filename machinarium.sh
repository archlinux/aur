#!/bin/sh
if [[ $CARCH == 'x86_64' ]]; then
  export GTK_PATH="/opt/lib32/usr/lib/gtk-2.0"
  export PANGO_RC_FILE="/opt/lib32/config/pango/pangorc"
  export GTK_IM_MODULE_FILE=""
fi

cd /usr/share/games/machinarium/
./Machinarium machinarium-browser.swf
