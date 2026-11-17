#!/bin/sh
# Upstream launches /opt/WorkBuddy/workbuddy directly; keep the same, minus
# any ELECTRON_RUN_AS_NODE inherited from a developer shell. Pin the window
# class to the desktop file's basename so X11 WM_CLASS and the Wayland app_id
# both match workbuddy-international.desktop (the product name has a space).
unset ELECTRON_RUN_AS_NODE
exec "$(dirname "$(readlink -f "$0")")/workbuddy" --class=workbuddy-international "$@"
