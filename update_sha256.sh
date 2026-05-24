#!/usr/bin/env bash
set -euo pipefail

PKGBUILD_PATH="${1:-PKGBUILD}"

# Logging config
LOG_LEVEL="${LOG_LEVEL:-INFO}"

if [[ -t 1 ]] && [[ -z "${NO_COLOR:-}" ]]; then
  CLR_RESET='\033[0m'
  CLR_DIM='\033[2m'
  CLR_BLUE='\033[34m'
  CLR_GREEN='\033[32m'
  CLR_YELLOW='\033[33m'
  CLR_RED='\033[31m'
else
  CLR_RESET=''
  CLR_DIM=''
  CLR_BLUE=''
  CLR_GREEN=''
  CLR_YELLOW=''
  CLR_RED=''
fi

_lvl_to_num() {
  case "$1" in
    DEBUG) echo 10 ;;
    INFO)  echo 20 ;;
    WARN)  echo 30 ;;
    ERROR) echo 40 ;;
    *)     echo 20 ;;
  esac
}

_should_log() {
  local current wanted
  current="$(_lvl_to_num "$LOG_LEVEL")"
  wanted="$(_lvl_to_num "$1")"
  [[ "$wanted" -ge "$current" ]]
}

_log() {
  local level="$1"
  local color="$2"
  shift 2

  _should_log "$level" || return 0

  printf '%b[%s]%b %s\n' "${CLR_DIM}${color}" "$level" "$CLR_RESET" "$*"
}

log_debug() { _log DEBUG "$CLR_DIM" "$@"; }
log_info()  { _log INFO  "$CLR_BLUE" "$@"; }
log_warn()  { _log WARN  "$CLR_YELLOW" "$@"; }
log_error() { _log ERROR "$CLR_RED" "$@"; }
log_ok()    { _log INFO  "$CLR_GREEN" "$@"; }

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  cat <<'EOF'
Usage: ./update_sha256.sh [PKGBUILD_PATH]

Computes SHA256 for the first source entry and updates sha256sums in PKGBUILD.

Environment:
  LOG_LEVEL=DEBUG|INFO|WARN|ERROR  Control verbosity (default: INFO)
  NO_COLOR=1                       Disable ANSI colors
EOF
  exit 0
fi

if [[ ! -f "$PKGBUILD_PATH" ]]; then
  log_error "PKGBUILD file not found: $PKGBUILD_PATH"
  exit 1
fi

log_info "Reading metadata from: $PKGBUILD_PATH"

# Read PKGBUILD variables in a separate Bash process without running build()/package().
metadata="$({
  bash -c '
    set -euo pipefail
    source "$1"
    declare -p pkgname pkgver source sha256sums
  ' _ "$PKGBUILD_PATH"
} 2>/dev/null)"

if [[ -z "$metadata" ]]; then
  log_error "Could not read PKGBUILD metadata."
  exit 1
fi

eval "$metadata"
log_debug "Loaded pkgname=$pkgname pkgver=$pkgver"

if [[ ${#source[@]} -eq 0 ]]; then
  log_error "source array is empty."
  exit 1
fi

src_entry="${source[0]}"
if [[ "$src_entry" == *"::"* ]]; then
  archive_name="${src_entry%%::*}"
  download_url="${src_entry#*::}"
else
  download_url="$src_entry"
  archive_name="$(basename "$src_entry")"
fi

if [[ -z "$archive_name" ]]; then
  archive_name="${pkgname}-${pkgver}.tar.gz"
fi

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

archive_path="$tmpdir/$archive_name"

log_info "Downloading source: $download_url"
curl -LfsS "$download_url" -o "$archive_path"
log_ok "Download finished: $archive_name"

new_sum="$(sha256sum "$archive_path" | awk '{print $1}')"
old_sum="${sha256sums[0]:-SKIP}"

log_info "Computed SHA256: $new_sum"

if [[ "$old_sum" != "SKIP" ]]; then
  if [[ "$old_sum" == "$new_sum" ]]; then
    log_ok "Checksum verified: existing SHA256 already matches."
  else
    log_warn "Checksum mismatch detected."
    log_warn "Old: $old_sum"
    log_warn "New: $new_sum"
  fi
else
  log_warn "PKGBUILD currently uses SKIP. Replacing with computed SHA256."
fi

# Replace the first sha256sums line (typical AUR case with one source file).
sed -i -E "0,/^sha256sums=\(.*\)$/s//sha256sums=('${new_sum}')/" "$PKGBUILD_PATH"

log_ok "PKGBUILD updated: $PKGBUILD_PATH"
