#!/usr/bin/env bash
# Disable GTK+ Overlay scrolling
# https://bugs.archlinux.org/task/63338
# https://bugs.eclipse.org/bugs/show_bug.cgi?id=519728
INSTALL_HOME=$(dirname $(realpath "${BASH_SOURCE[0]}"));
export GTK_OVERLAY_SCROLLING=0
"${INSTALL_HOME}/dbeaver" "$@" > /dev/null 2>&1
