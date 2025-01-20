#!/bin/sh

if pgrep plasmashell > /dev/null; then if ls /run/user/$(id -u)/wayland-* &> /dev/null; then exit; fi; fi; ibus-daemon -drx
