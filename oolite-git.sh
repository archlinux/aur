#!/bin/bash
if [ ! -d ~/.Oolite/AddOns ]; then
    mkdir -p ~/.Oolite/AddOns
fi
if [ ! -d ~/~/GNUstep/Library/ApplicationSupport/Oolite/ManagedAddOns ]; then
    mkdir -p ~/GNUstep/Library/ApplicationSupport/Oolite/ManagedAddOns
fi
/usr/share/oolite-git/splash-launcher /usr/share/oolite-git/Resources/Images/splash.bmp
exec /usr/share/oolite-git/oolite -nosplash "$@"
