#!/bin/bash
if [ ! -d ~/.Oolite/AddOns ]; then
    mkdir -p ~/.Oolite/AddOns
fi
if [ ! -d ~/~/GNUstep/Library/ApplicationSupport/Oolite/ManagedAddOns ]; then
    mkdir -p ~/GNUstep/Library/ApplicationSupport/Oolite/ManagedAddOns
fi
exec /usr/share/oolite-git/oolite "$@"
