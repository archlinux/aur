#!/bin/bash
local dest="org.fcitx.Fcitx"
local path="/inputmethod"
local method="${dest}.InputMethod.ToggleIM"
local args="--dest=${dest} ${path} ${method}"
dbus-send ${args}
