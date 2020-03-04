#!/bin/sh

# To be copied to /etc/profile.d/ime.sh

# Identify fcitx as a input module for both GTK and QT apps
XMODIFIERS=@im=fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx

export XMODIFIERS GTK_IM_MODULE QT_IM_MODULE
echo we set XMODIFIERS GTK_IM_MODULE QT_IM_MODULE in profile.d
