#!/bin/sh
# Open WebUI desktop wrapper — uses system Electron with Wayland support
# --ozone-platform-hint=auto: native Wayland when available, X11 fallback
# --no-sandbox: the renderer sandbox blocks shared memory in /tmp on some
#   systems, causing the webview to render blank. (As of v0.0.15 upstream
#   also ships --disable-gpu which handles GPU-process crashes separately.)
# --enable-features=GlobalShortcutsPortal: use D-Bus portal for global
#   shortcuts on Wayland (works on KDE/Hyprland, no-op elsewhere)
# --enable-features=WaylandTextInput: enables zwp_text_input_v3 protocol
#   for proper IME support (CJK input methods) on native Wayland sessions
exec electron /usr/lib/open-webui/app.asar \
  --ozone-platform-hint=auto \
  --no-sandbox \
  --enable-features=GlobalShortcutsPortal,WaylandTextInput \
  "$@"