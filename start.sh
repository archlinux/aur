#!/bin/sh
# Upstream launches /opt/WorkBuddy/workbuddy directly; keep the same, minus
# any ELECTRON_RUN_AS_NODE inherited from a developer shell. Pin the window
# class to the desktop file's basename so X11 WM_CLASS and the Wayland app_id
# both match workbuddy-international.desktop (the product name has a space).
unset ELECTRON_RUN_AS_NODE
export CHROME_DESKTOP='workbuddy-international.desktop'
export ELECTRON_FORCE_IS_PACKAGED=1

# On Wayland Electron registers the toggle-window hotkey through the XDG
# GlobalShortcuts portal, which makes GNOME show an "Add Keyboard Shortcuts"
# dialog on every launch. An empty accelerator in shortcut-state.json means
# "do not register"; seed it before the first run. X11 never triggers the
# portal, so the upstream default hotkey is kept there.
if [ "${XDG_SESSION_TYPE:-}" = wayland ] || [ -n "${WAYLAND_DISPLAY:-}" ]; then
  _state_dir="${WORKBUDDY_USER_DATA_DIR:-${WORKBUDDY_CONFIG_DIR:-${CODEBUDDY_CONFIG_DIR:-${HOME}/.workbuddy-ai}}/app}"
  if [ ! -f "${_state_dir}/shortcut-state.json" ]; then
    mkdir -p "${_state_dir}" &&
      printf '%s\n' '{"version":1,"toggleWindowAccelerator":""}' \
        >"${_state_dir}/shortcut-state.json" || true
  fi
fi

# Keep the runtime flags the deb-based package used: the Windows payload runs
# on the domestic deb's Electron, which needs the GPU sandbox disabled and the
# Wayland IME/ozone hints to avoid a blank window on some drivers.
exec "$(dirname "$(readlink -f "$0")")/workbuddy" \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu-sandbox \
  --in-process-gpu \
  --ozone-platform-hint=auto \
  --enable-wayland-ime \
  --class=workbuddy-international "$@"
