#!/bin/sh
[ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh
[ -f /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh

exec java -jar /usr/share/xvpvncviewer/VncViewer.jar URL "$@"
