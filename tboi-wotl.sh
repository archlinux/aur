#!/bin/bash

_desktopfile="$(locate $(xdg-settings get default-web-browser) | tail -n 1)"
_swf="/usr/share/tboi-wotl/tboi-wotl.swf"

exec $(grep "^Exec=" $_desktopfile | head -n 1 | sed "s/Exec=//" | sed "s:%[Uu]:$_swf:")