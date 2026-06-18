#!/bin/bash

is_nvidia_system() {
  [[ -e /proc/driver/nvidia/version ]] && return 0
  [[ -d /sys/module/nvidia ]] && return 0
  command -v nvidia-smi >/dev/null 2>&1 && return 0

  local vendor
  for vendor in /sys/class/drm/card*/device/vendor /sys/bus/pci/devices/*/vendor; do
    [[ -r "$vendor" ]] || continue
    [[ "$(cat "$vendor")" == "0x10de" ]] && return 0
  done

  return 1
}

if is_nvidia_system; then
  export MOZ_ENABLE_WAYLAND="${MOZ_ENABLE_WAYLAND:-1}"
  export LIBVA_DRIVER_NAME="${LIBVA_DRIVER_NAME:-nvidia}"
  export NVD_BACKEND="${NVD_BACKEND:-direct}"
  export MOZ_DISABLE_RDD_SANDBOX="${MOZ_DISABLE_RDD_SANDBOX:-1}"
fi

exec /opt/zen-browser-bin/zen-bin "$@"
