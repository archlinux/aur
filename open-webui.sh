#!/bin/sh
# Open WebUI desktop wrapper — uses system Electron with Wayland support
# --ozone-platform-hint=auto: native Wayland when available, X11 fallback
# --no-sandbox: required for system Electron (app sets this too, but CLI flag
#   takes effect before GPU process spawn, preventing shared-memory FATAL)
# --enable-features=GlobalShortcutsPortal: use D-Bus portal for global
#   shortcuts on Wayland (works on KDE/Hyprland, no-op elsewhere)
# --enable-features=WaylandTextInput: enables zwp_text_input_v3 protocol
#   for proper IME support (CJK input methods) on native Wayland sessions
exec electron /usr/lib/open-webui/app.asar \
  --ozone-platform-hint=auto \
  --no-sandbox \
  --enable-features=GlobalShortcutsPortal,WaylandTextInput \
  "$@"