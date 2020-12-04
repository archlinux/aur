#!/bin/sh
/opt/appimages/./kdenlive.AppImage $@
echo "StartupWMClass=kdenlive" >> /usr/share/applications/org.kde.kdenlive.desktop
