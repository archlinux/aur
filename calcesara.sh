#!/bin/bash

set -e

case $1 in
    fast) lnk=calceFAST;;
    tce|tcextractor) lnk=calceTCExtractor;;
    docs) lnk=User\ Documentation;;
    pwa) lnk=calcePWA;;
    wr|whiskerrisk) lnk=calceWhiskerRisk;;
    updates) lnk=Updates;;
    *) echo "Options are: fast, tce|tcextractor, docs, pwa, wr|whiskerrisk, updates" && exit 1;;
esac

export WINEPREFIX="$HOME/.local/share/wineprefixes/calcesara"

lnk_full="$WINEPREFIX/drive_c/users/$USER/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/calceSARAv@pkgver@/$lnk.lnk"

launch() {
    wine "$lnk_full"
}

install_fonts() {
    if [[ ! -f "$WINEPREFIX/drive_c/windows/Fonts/corefonts.installed" ]]; then
        # Otherwise all text will just be rectangles
        winetricks corefonts
    fi
}

install() {
    echo "Running installer..."
    install_fonts &
    wine "/opt/calcesara/install_calceSARAv@pkgver@.exe" /S
    wait
}

install_launch() {
    install && launch
}

if [[ ! -f "$lnk_full" ]]; then
    install_launch
else
    install_fonts
    launch || install_launch
fi
