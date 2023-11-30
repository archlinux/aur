#!/bin/bash
export QT_QPA_PLATAFORM=xdgdesktopportal
export QT_QPA_PLATFORMTHEME=xdgdesktopportal
cd /opt/cura5/
LD_PRELOAD=/usr/lib/libstdc++.so.6 QT_QPA_PLATFORMTHEME=xdgdesktopportal QT_QPA_PLATAFORM=xdgdesktopportal QT_STYLE_OVERRIDE="" ./AppRun $@

