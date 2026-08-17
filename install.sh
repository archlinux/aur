#!/usr/bin/env bash
set -euo pipefail

# PrettyZap — Omarchy/Quickshell integration installer.
#
# Installs the Omarchy bar widget and/or the standalone Quickshell widget into
# the user's configuration and enables the plugin through Omarchy's own
# additive path. It never rewrites shell.json wholesale: `omarchy plugin
# enable` adds exactly one entry to one bar section, and nothing else in the
# user's config is touched. Files are always copied, never symlinked (the
# plugin validator rejects symlinks).
#
#   install.sh [--plugin] [--standalone] [--uninstall] [--section <left|center|right>]
#
# From the repo checkout this uses ./plugin and ./standalone. The AUR wrapper
# (prettyzap-omarchy-setup) overrides PZ_PLUGIN_SRC / PZ_STANDALONE_SRC with
# the packaged paths under /usr/share/prettyzap.

PLUGIN_ID="prettyletto.prettyzap"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PZ_PLUGIN_SRC="${PZ_PLUGIN_SRC:-$BASE_DIR/plugin}"
PZ_STANDALONE_SRC="${PZ_STANDALONE_SRC:-$BASE_DIR/standalone}"

PLUGIN_DEST="$HOME/.config/omarchy/plugins/$PLUGIN_ID"
STANDALONE_DEST="$HOME/.config/quickshell/prettyzap"

usage() {
  cat <<'USAGE'
Usage: install.sh [--plugin] [--standalone] [--uninstall] [--section <left|center|right>]

  --plugin       Install and enable the Omarchy bar widget (default when no
                 flags are given).
  --standalone   Install the standalone Quickshell widget to
                 ~/.config/quickshell/prettyzap/ (no Omarchy required).
  --uninstall    Disable and remove both.
  --section      Where the widget sits in the bar: left, center, or right.
                 Without it, install.sh asks interactively (or uses
                 $PZ_BAR_SECTION, or defaults to right when non-interactive).

The plugin install is additive: `omarchy plugin enable` adds a single entry to
one bar section. Nothing else in ~/.config/omarchy/shell.json is touched.
USAGE
}

MODE=""
BAR_SECTION=""

while (( $# > 0 )); do
  case "$1" in
    --plugin) MODE="plugin" ;;
    --standalone) MODE="standalone" ;;
    --uninstall) MODE="uninstall" ;;
    --section)
      section_value="${2:-}"
      [[ -n $section_value ]] || { echo "error: --section requires left, center, or right" >&2; exit 1; }
      BAR_SECTION="${section_value,,}"
      if [[ $BAR_SECTION != left && $BAR_SECTION != center && $BAR_SECTION != right ]]; then
        echo "error: --section must be left, center, or right (got: $section_value)" >&2
        exit 1
      fi
      shift 2
      continue
      ;;
    -h | --help) usage; exit 0 ;;
    *) echo "unknown option: $1" >&2; usage >&2; exit 1 ;;
  esac
  shift
done

[[ -n $MODE ]] || MODE="plugin"

if [[ -n $BAR_SECTION && $MODE != plugin ]]; then
  echo "error: --section only applies to the plugin install (not --standalone or --uninstall)" >&2
  exit 1
fi

# Decide the bar section. Precedence: --section flag, then the PZ_BAR_SECTION
# environment variable (for non-interactive/AUR calls), then an interactive
# prompt when stdin is a terminal, then the manifest default (right).
choose_section() {
  local section="${BAR_SECTION:-${PZ_BAR_SECTION:-}}"
  if [[ -n $section ]]; then
    section="${section,,}"
    if [[ $section != left && $section != center && $section != right ]]; then
      echo "error: PZ_BAR_SECTION must be left, center, or right (got: $section)" >&2
      exit 1
    fi
    echo "$section"
    return
  fi
  if [[ ! -t 0 ]]; then
    echo "right"
    return
  fi
  local choice
  while true; do
    read -r -p "Where should the PrettyZap icon sit in the bar? [left/center/right] (default: right): " choice
    choice="${choice,,}"
    case "$choice" in
      "" | right) echo "right"; return ;;
      left | center) echo "$choice"; return ;;
      *) echo "  please enter left, center, or right." >&2 ;;
    esac
  done
}

shell_ready() {
  omarchy-shell shell ping >/dev/null 2>&1
}

enable_plugin() {
  local section="$1"
  if ! shell_ready; then
    echo "  note: omarchy-shell is not running; the widget is installed but not enabled."
    echo "        Run later: omarchy plugin enable $PLUGIN_ID $section"
    return
  fi
  omarchy-shell shell rescanPlugins >/dev/null 2>&1 || true
  if omarchy plugin enable "$PLUGIN_ID" "$section" 2>&1; then
    echo "  enabled $PLUGIN_ID on the $section side of the bar."
  else
    echo "  note: could not enable $PLUGIN_ID automatically."
    echo "        Run: omarchy plugin enable $PLUGIN_ID $section"
  fi
}

install_plugin() {
  if [[ ! -f "$PZ_PLUGIN_SRC/manifest.json" ]]; then
    echo "error: plugin source not found at $PZ_PLUGIN_SRC" >&2
    exit 1
  fi
  local section
  section="$(choose_section)"
  echo "Installing the Omarchy bar widget ($PLUGIN_ID) on the $section side of the bar..."
  mkdir -p "$(dirname "$PLUGIN_DEST")"
  rm -rf "$PLUGIN_DEST"
  cp -r "$PZ_PLUGIN_SRC" "$PLUGIN_DEST"
  if ! omarchy plugin validate "$PLUGIN_DEST" 2>&1; then
    echo "error: installed plugin failed validation; removed it again" >&2
    rm -rf "$PLUGIN_DEST"
    exit 1
  fi
  echo "  copied to $PLUGIN_DEST"
  enable_plugin "$section"
  echo "Done. The PrettyZap icon should appear on the $section side of the bar."
  echo "      Left-click opens/hides the app · right-click opens the panel."
  echo "      Move it any time: omarchy plugin enable $PLUGIN_ID <left|center|right>"
}

install_standalone() {
  if [[ ! -f "$PZ_STANDALONE_SRC/shell.qml" ]]; then
    echo "error: standalone source not found at $PZ_STANDALONE_SRC" >&2
    exit 1
  fi
  echo "Installing the standalone Quickshell widget..."
  mkdir -p "$STANDALONE_DEST"
  cp -r "$PZ_STANDALONE_SRC/." "$STANDALONE_DEST/"
  echo "  copied to $STANDALONE_DEST"
  echo "Done. Run it with:"
  echo "      quickshell -p $STANDALONE_DEST"
  echo "  or, to start it with the desktop, add to autostart:"
  echo "      quickshell -n -p $STANDALONE_DEST"
}

uninstall_all() {
  echo "Removing the PrettyZap Omarchy integration..."
  if shell_ready; then
    omarchy plugin disable "$PLUGIN_ID" 2>&1 || true
  else
    echo "  note: omarchy-shell is not running; skipping disable."
  fi
  rm -rf "$PLUGIN_DEST"
  rm -rf "$STANDALONE_DEST"
  echo "Removed the plugin and the standalone widget."
}

case "$MODE" in
  plugin) install_plugin ;;
  standalone) install_standalone ;;
  uninstall) uninstall_all ;;
esac
