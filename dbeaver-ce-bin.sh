#!/bin/sh
# Disable GTK+ Overlay scrolling
# https://bugs.archlinux.org/task/63338
# https://bugs.eclipse.org/bugs/show_bug.cgi?id=519728
export GTK_OVERLAY_SCROLLING=0
/usr/lib/dbeaver/dbeaver $@
