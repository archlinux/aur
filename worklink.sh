#!/usr/bin/env bash
# Wrapper that enables IME (fcitx/ibus) support for the Electron-based worklink.
# Electron 32 registers a wayland_v2 text-input IC but never calls enable() when
# a web <input> gains focus, so fcitx5 stays idle. Force XWayland so IME goes
# through the fcitx5 GTK3 immodule instead.

: "${GTK_IM_MODULE:=fcitx}"
: "${QT_IM_MODULE:=fcitx}"
: "${XMODIFIERS:=@im=fcitx}"
export GTK_IM_MODULE QT_IM_MODULE XMODIFIERS

exec '/opt/招商随行/worklink' --ozone-platform=x11 "$@"
