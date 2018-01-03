#!/bin/bash

# Avoid that install dialog is shown when starting browser
export APPIMAGE_SILENT_INSTALL=1

# Launch AppImage application
/opt/beaker-browser/beaker-browser.AppImage

# Since launching the AppImage performs the installation silently
# remove files that have been installed locally after run
if [ -e ~/.local/share/applications/appimagekit-beaker-browser.desktop ];
then
    rm ~/.local/share/applications/appimagekit-beaker-browser.desktop;

    prefix=~/.local/share/icons/hicolor/
    resolutions=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    postfix=/apps/appimagekit-beaker-browser.png

    for i in {0..9};
    do
        rm ${prefix}${resolutions[$i]}${postfix};
    done
fi
