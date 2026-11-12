#!/bin/sh
# 国内版固定走中国大陆 API，不随登录账号或区域标记切换。
export KIMI_CODE_HOME="${KIMI_CODE_HOME:-$HOME/.kimi-code-cn}"
export KIMI_CODE_OAUTH_HOST='https://auth.kimi.com'
export KIMI_CODE_BASE_URL='https://api.kimi.com/coding/v1'
export KIMI_CODE_REGION_MARKER=off
# Wayland 下 Electron 的全局快捷键走 XDG GlobalShortcuts portal，上游会给 Chromium
# 追加 GlobalShortcutsPortal 特性，导致每次启动都让 GNOME 弹出 "Add Keyboard
# Shortcuts" 授权窗。启动时禁用该特性（disable 优先于上游的 enable），默认不注册
# 全局快捷键；X11 下保持上游行为。需要时应改用 X11 会话或等上游提供开关。
if [ "${XDG_SESSION_TYPE:-}" = wayland ] || [ -n "${WAYLAND_DISPLAY:-}" ]; then
  exec '/opt/kimi-code-cn/kimi-code-cn' --disable-features=GlobalShortcutsPortal "$@"
fi
exec '/opt/kimi-code-cn/kimi-code-cn' "$@"
