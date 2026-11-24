#!/bin/bash
# Shared prerequisite locations (overridable): the pristine SDK package and the
# system Node.js runtime, so this package ships neither copy.
export DEVECO_SDK_HOME=${DEVECO_SDK_HOME:-/opt/deveco-sdk}
export DEVECO_NODE_HOME=${DEVECO_NODE_HOME:-/usr}
export _JAVA_AWT_WM_NONREPARENTING=1
# Emulator uses the Qt xcb platform plugin (no wayland build shipped)
export QT_QPA_PLATFORM=xcb
# XWayland reports monitor scale 1.0 to JBR, so the IDE locks UI scale to
# 1.0 — too small on HiDPI. Inject the compositor's real scale (wlr-randr,
# needs WAYLAND_DISPLAY so run it before unsetting it) as -Dide.ui.scale.
# DEVECO_UI_SCALE: number (override, as-is) or "off" (disable).
_hidpi_scale=""
case "${DEVECO_UI_SCALE:-auto}" in
  off) ;;
  auto)
    _cs=""
    command -v wlr-randr >/dev/null 2>&1 && \
      _cs=$(wlr-randr 2>/dev/null | awk '/Scale:/{print $2; exit}')
    if [[ "$_cs" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
      _hidpi_scale=$(LC_ALL=C awk -v s="$_cs" 'BEGIN{ q=int(s*4+0.5)/4; if (q<1.0) q=1.0; printf "%.2f", q }')
    fi
    ;;
  *)
    if [[ "$DEVECO_UI_SCALE" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
      _hidpi_scale="$DEVECO_UI_SCALE"
    else
      printf 'Ignoring invalid DEVECO_UI_SCALE=%q (expected auto, off, or a number)\n' \
        "$DEVECO_UI_SCALE" >&2
    fi
    ;;
esac
if [[ -n "$_hidpi_scale" ]]; then
  _cfg="${XDG_CONFIG_HOME:-$HOME/.config}/Huawei/DevEcoStudio26.0"
  if mkdir -p "$_cfg"; then
    echo "-Dide.ui.scale=$_hidpi_scale" > "$_cfg/devecostudio-hidpi.vmoptions"
    export DEVECOSTUDIO_VM_OPTIONS="$_cfg/devecostudio-hidpi.vmoptions"
  else
    printf 'Unable to create the HiDPI vmoptions overlay in %s\n' "$_cfg" >&2
  fi
fi
# JCEF GPU process crashes under Wayland; use the X11 backend by default
# (DEVECO_DISABLE_X11_WORKAROUND=1 to keep Wayland).
if [[ "${DEVECO_DISABLE_X11_WORKAROUND:-0}" != "1" ]]; then
  unset WAYLAND_DISPLAY
  export GDK_BACKEND=x11
fi
# JCEF headless + out-of-process rendering fixes blank CEF pages in some
# environments (DEVECO_DISABLE_JCEF_HEADLESS=1 to opt out).
_JCEF_ARGS=()
if [[ "${DEVECO_DISABLE_JCEF_HEADLESS:-0}" != "1" ]]; then
  _JCEF_ARGS=("-Dide.browser.jcef.headless.enabled=true" "-Dide.browser.jcef.out-of-process.enabled=true")
fi
# Emulator hardcodes the macOS-style image path ~/Library/Huawei/Sdk
mkdir -p "$HOME/Library/Huawei"
ln -sfn "$HOME/.Huawei/Sdk" "$HOME/Library/Huawei/Sdk"
# appanalyzer python workaround (Huawei Linux gap): initRequirements
# writes requirements/python_X/, but getPipLibraryDownloaded reads
# requirements/Python_X/ (from `python3 --version` output). Case-
# insensitive filesystems hide this; Linux does not → NPE. Bridge the
# two names and seed requirements.json from the jar when missing. Also
# fix the torch scenario: the pinned torchvision 0.21.0 needs torch 2.6
# while the pin is torch 2.2.2 (a conflict that only resolves on
# non-Linux because the cuda deps are Linux-gated); downgrade to 0.17.2.
_pybin="/opt/devecostudio/plugins/app-analyzer/lib/python/bin"
_pyver=$("$_pybin/python3" --version 2>/dev/null | awk '{print $2}')
if [[ -n "$_pyver" ]]; then
  _an="$HOME/.cache/Huawei/DevEcoStudio26.0/caches/appanalyzer"
  _req_dir="$_an/pythonconfig/requirements"
  _req_file="$_req_dir/python_$_pyver/requirements.json"
  mkdir -p "$_req_dir/python_$_pyver"
  ln -sfn "python_$_pyver" "$_req_dir/Python_$_pyver"
  if [[ ! -s "$_req_file" ]]; then
    # The jar name carries the DevEco version, so glob it: a hardcoded
    # 26.0.0.821 name silently seeded a 0-byte file on 26.0.0.851 (and
    # would keep retrying and failing forever). Write via a temp file so a
    # failed extraction never leaves an empty file behind.
    _jar=$(ls /opt/devecostudio/plugins/app-analyzer/lib/hos-app-analyzer-[0-9]*.jar 2>/dev/null | head -1)
    if [[ -n "$_jar" ]]; then
      unzip -p "$_jar" "python/${_pyver%.*}/requirements_external.json" > "$_req_file.tmp" 2>/dev/null \
        && mv "$_req_file.tmp" "$_req_file" || rm -f "$_req_file.tmp"
    fi
  fi
  "$_pybin/python3" - "$_req_file" << 'PYEOF'
import json, os, sys
p = sys.argv[1]
if os.path.exists(p) and os.path.getsize(p) > 0:
    try:
        d = json.load(open(p))
        for dep in d.get("dependencies", []):
            if dep.get("name") == "torchvision" and dep.get("version") == "0.21.0":
                dep["version"] = "0.17.2"
                json.dump(d, open(p, "w"), ensure_ascii=False, indent=2)
                break
    except Exception:
        pass
PYEOF
fi
exec "$(dirname "$(readlink -f "$0")")/devecostudio" "${_JCEF_ARGS[@]}" "$@"
