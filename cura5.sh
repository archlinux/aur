#!/bin/bash
export QT_QPA_PLATAFORM=xdgdesktopportal
export QT_QPA_PLATFORMTHEME=xdgdesktopportal
cd /opt/cura5/
QT_QPA_PLATFORMTHEME=xdgdesktopportal QT_QPA_PLATAFORM=xdgdesktopportal ./Ultimaker-Cura $@

