#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"

# Base environment variables
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export NODE_ENV=production
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"

# 1. Display System Optimization (X11 & Wayland)
# Use 'auto' to allow modern Electron (v20+) to detect the best platform
# This helps with Wayland window decorations, fractional scaling, and GPU acceleration
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"

# 2. Desktop Environment (DE) Compatibility
# Set CHROME_DESKTOP to match the .desktop file for correct taskbar icon grouping
export CHROME_DESKTOP="@appname@.desktop"

# Fix for Electron's trash implementation on different DEs
case "${XDG_CURRENT_DESKTOP}" in
    KDE)
        export ELECTRON_TRASH="kioclient5"
        ;;
    GNOME)
        export ELECTRON_TRASH="gio"
        ;;
    XFCE)
        export ELECTRON_TRASH="gvfs-trash"
        ;;
    *)
        # Default fallback
        ;;
esac

# 3. Memory usage optimization
# Safe Chromium/Electron defaults that keep RAM usage in check (Electron 41 / Chromium 134+):
#   - PartitionAllocMemoryReclaimer: periodically returns freed allocator memory
#     to the OS, preventing RSS from growing monotonically
#   - IntensiveWakeUpThrottling: aggressively throttles timers in background views
#   - BackForwardCache disabled: an editor never uses back/forward navigation,
#     so cached page snapshots are wasted memory
#   - force-gpu-mem-available-mb=512: cap the GPU compositor/tile memory budget
# These defaults are placed BEFORE user flags below, so any value provided via
# flags.conf (e.g. --enable-features=...) overrides them (last one wins).
# NOTE: keep "${_RUNNAME}" as argv[1] (right after the electron binary) - ZCode
# uses process.argv[1] as its deep-link entry, so all switches must come after it.
_MEMORY_FLAGS=(
    "--enable-features=PartitionAllocMemoryReclaimer,IntensiveWakeUpThrottling"
    "--disable-features=BackForwardCache"
    "--force-gpu-mem-available-mb=512"
)

# Aggressive mode for low-RAM machines: ZCODE_MEMORY_SAVER=1 zcode
# Disables GPU compositing and caps the V8 old-space heap. Expect software
# rendering; raise --max-old-space-size for very large projects.
if [[ "${ZCODE_MEMORY_SAVER:-0}" == "1" ]]; then
    _MEMORY_FLAGS+=(
        "--disable-gpu"
        "--js-flags=--max-old-space-size=3072"
    )
fi

# 4. Load user-defined flags
# The script checks for flags in the following order (later files override/append to earlier ones):
# 1. System-wide Electron flags: $XDG_CONFIG_HOME/electron-flags.conf
# 2. Version-specific Electron flags: $XDG_CONFIG_HOME/electron@electronversion@-flags.conf
# 3. App-specific global flags: $XDG_CONFIG_HOME/@appname@-flags.conf
# 4. App-specific directory flags: $XDG_CONFIG_HOME/@cfgdirname@/@appname@-flags.conf
_FLAG_SOURCES=(
    "${XDG_CONFIG_HOME}/electron-flags.conf"
    "${XDG_CONFIG_HOME}/electron@electronversion@-flags.conf"
    "${XDG_CONFIG_HOME}/@appname@-flags.conf"
    "${XDG_CONFIG_HOME}/@cfgdirname@/@appname@-flags.conf"
)

declare -a flags
for _FLAGS_FILE in "${_FLAG_SOURCES[@]}"; do
    if [[ -f "${_FLAGS_FILE}" ]]; then
        echo "Loading flags from ${_FLAGS_FILE}"
        while read -r line || [[ -n "$line" ]]; do
            [[ "${line}" =~ ^[[:space:]]*#.* ]] || [[ -z "${line}" ]] || {
                read -ra line_flags <<< "$line"
                flags+=("${line_flags[@]}")
            }
        done < "${_FLAGS_FILE}"
    fi
done

# 5. Sandbox and Execution Permissions
# Disable sandbox if running as root without ELECTRON_RUN_AS_NODE
_SANDBOX_ARG=()
if [[ "${EUID}" -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
    _SANDBOX_ARG=("--no-sandbox")
fi

cd "${_APPDIR}"
exec electron@electronversion@ "${_RUNNAME}" "${_MEMORY_FLAGS[@]}" "${flags[@]}" "${_SANDBOX_ARG[@]}" "$@"
