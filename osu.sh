#!/usr/bin/env bash
set -euo pipefail

# ── Paths & env ──────────────────────────────────────────────────────────────
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
OSU_STABLE_DATA_DIRECTORY="${OSU_STABLE_DATA_DIRECTORY:-$XDG_DATA_HOME/osu-stable}"
WINEPREFIX="${WINEPREFIX:-$XDG_DATA_HOME/wineprefixes/osu-stable}"
export WINEPREFIX WINEARCH='win32'

COMPLETED_FLAG="$WINEPREFIX/.completed"
OSU_VERSION_FILE="$OSU_STABLE_DATA_DIRECTORY/.version"
LOGFILE="/tmp/osu-wine-setup.log"

FORCE_RESET=false
RAN_INSTALL=false

# ── Helpers ──────────────────────────────────────────────────────────────────
get_osu_pkg_date() { # → echoes YYYYMMDD or fails
  local info ver
  info=$(pacman -Q osu 2>/dev/null) || return 1
  ver=${info##* } # second column
  ver=${ver#*:}   # drop epoch
  printf '%s\n' "${ver%%-*}"
}

setup_wineprefix() {
  if [[ "$FORCE_RESET" == true && -d "$WINEPREFIX" ]]; then
    read -rp "⚠️  ${WINEPREFIX} exists. Remove Wine prefix during force-reset? [y/N] " ans
    if [[ ${ans:-n} =~ ^[Yy]$ ]]; then
      rm -rf "$WINEPREFIX"
      echo "✅ Removed Wine prefix at ${WINEPREFIX}"
    else
      echo "⏭️  Skipping Wine prefix setup (user declined reset)."
      return
    fi
  fi

  echo "▶ Setting up Wine prefix. This may take a while…"
  mkdir -p "$WINEPREFIX"

  if umu-run winetricks dotnet45 cjkfonts >>"$LOGFILE" 2>&1; then
    touch "$COMPLETED_FLAG"
    echo "✅ Wine prefix ready (log: $LOGFILE)"
  else
    echo "❌ Prefix setup failed (see $LOGFILE)" >&2
    exit 1
  fi
}

install_osu_stable() {
  if [[ "$FORCE_RESET" == true && -d "$OSU_STABLE_DATA_DIRECTORY" ]]; then
    read -rp "⚠️  ${OSU_STABLE_DATA_DIRECTORY} detected during force-reset. Clear data directory? [y/N] " ans
    if [[ ${ans:-n} =~ ^[Yy]$ ]]; then
      rm -rf "${OSU_STABLE_DATA_DIRECTORY}"
      echo "✅ Cleared ${OSU_STABLE_DATA_DIRECTORY}"
    fi
  fi
  echo "▶ Installing osu!stable…"
  mkdir -p "$OSU_STABLE_DATA_DIRECTORY"
  cp /usr/share/osu/osu-stable-installer.exe "$OSU_STABLE_DATA_DIRECTORY"
  umu-run "$OSU_STABLE_DATA_DIRECTORY/osu-stable-installer.exe"
  echo "✅ osu!stable installed."
  if ver=$(get_osu_pkg_date); then
    echo "$ver" >"$OSU_VERSION_FILE"
  fi
  RAN_INSTALL=true
}

print_help() {
  cat <<EOF
Usage:
  $(basename "$0")             Run the game (osu!.exe)
  $(basename "$0") wine [...]  Run Wine command in prefix
  $(basename "$0") winetricks [...]  Run Winetricks in prefix
  $(basename "$0") --force-reset     Rebuild the Wine prefix from scratch
  $(basename "$0") {-h|--help|help}  Show this help
EOF
}

# ── Flag parsing ─────────────────────────────────────────────────────────────
args=()
while (($#)); do
  case $1 in
  --force-reset) FORCE_RESET=true ;;
  -h | --help | help)
    print_help
    exit 0
    ;;
  *) args+=("$1") ;;
  esac
  shift
done
set -- "${args[@]:-}"

# ── Wine prefix logic ────────────────────────────────────────────────────────
if [[ "$FORCE_RESET" == true ]]; then
  setup_wineprefix
elif [[ -f "$COMPLETED_FLAG" ]]; then
  : # OK
elif [[ -d "$WINEPREFIX" ]]; then
  if [[ -t 0 ]]; then
    read -rp "⚠️  Wine prefix ${WINEPREFIX} exists but is not marked complete. Use it anyway? [y/N] " ans
    if [[ ${ans:-n} =~ ^[Yy]$ ]]; then
      touch "$COMPLETED_FLAG"
      echo "✅ Marked existing prefix as completed."
    else
      echo "🧹 Removing existing Wine prefix at $WINEPREFIX..."
      rm -rf "$WINEPREFIX"
      setup_wineprefix
    fi
  else
    echo "⚠️  Wine prefix exists but is not marked complete, and no terminal is available."
    echo "⏭️  Skipping setup to avoid unintended data loss."
    echo "   To force a rebuild, run: osu-stable --force-reset"
    touch "$COMPLETED_FLAG"
  fi
fi

# ── osu! install / upgrade check ─────────────────────────────────────────────
current_pkg_date=""
if current_pkg_date=$(get_osu_pkg_date); then
  recorded_date=$(cat "$OSU_VERSION_FILE" 2>/dev/null || echo "")
  if [[ "$current_pkg_date" != "$recorded_date" ]]; then
    echo "▶ osu! updated ($recorded_date → $current_pkg_date). Re‑installing…  If installer crashes, just press 'restart osu!'"
    logfile="${OSU_STABLE_DATA_DIRECTORY}/Logs/update_success.log"
    pre_mtime=$(date +%s)
    [[ -f "$logfile" ]] && pre_mtime=$(stat -c %Y "$logfile")
    install_osu_stable

    # Re-check mtime after install - there's a quirk where the updater always reports a crash
    if [[ -n "$pre_mtime" && -f "$logfile" ]]; then
      post_mtime=$(stat -c %Y "$logfile")
      if [[ "$post_mtime" -le "$pre_mtime" ]]; then
        echo -e "\n⚠️  osu! was not updated"
        echo -e "\n⚠️  make sure to press the 'restart osu!' button if the installer/updater crashes\n"
        rm ${OSU_STABLE_DATA_DIRECTORY}/.version
        exit 1
      fi
    fi
  else
    echo "▶ osu! ($recorded_date → $current_pkg_date). Up-to-date…"
  fi
fi
[[ -d "$OSU_STABLE_DATA_DIRECTORY" && "$FORCE_RESET" != true ]] || install_osu_stable

# ── Command dispatch ─────────────────────────────────────────────────────────
case "${1:-}" in
winetricks)
  shift
  umu-run winetricks "$@"
  ;;
wine)
  shift
  umu-run "$@"
  ;;
-h | --help | help) print_help ;;
*)
  if [[ "$RAN_INSTALL" == false ]]; then
    env vblank_mode="${vblank_mode:-0}" __GL_SYNC_TO_VBLANK="${__GL_SYNC_TO_VBLANK:-0}" \
      umu-run "$OSU_STABLE_DATA_DIRECTORY/osu!.exe" "$@"
  fi
  ;;
esac
