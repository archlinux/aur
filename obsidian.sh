#!/bin/bash

export _portableConfig=md.obsidian.app

launchTarget="electron34 /usr/lib/obsidian/app.asar --ozone-platform-hint=auto --enable-wayland-ime --wayland-text-input-version=3 $@" portable --actions connect-tty
