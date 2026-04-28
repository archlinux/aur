#!/usr/bin/env bash
# shellcheck shell=bash
# ──────────────────────────────────────────────────────────────────────────────
# AstrBot Cross-Platform Installer  |  supports: Arch / Debian / Ubuntu / RHEL / Fedora / openSUSE
#
# Usage:
#   ./setup.sh               Install / Refresh AstrBot
#   ./setup.sh deps          Step 1: Install dependencies only
#   ./setup.sh setups        Step 2: Setup users / dirs / permissions
#   ./setup.sh files         Step 3: Install app + management scripts + service
#   ./setup.sh help          Show this help
# ──────────────────────────────────────────────────────────────────────────────
set -euo pipefail

# BASH_SOURCE[0] is empty when run via: curl ... | bash
# Use PWD as fallback so the script still works
if [[ -z "${BASH_SOURCE[0]:-}" ]]; then
    _SCRIPT_DIR="$(pwd)"
else
    _SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi
REPO_ROOT="${REPO_ROOT:-$_SCRIPT_DIR}"
SKIP_ALLGREETING="${SKIP_ALLGREETING:-false}"
SKIP_ALLDEPS="${SKIP_ALLDEPS:-false}"
SKIP_ALLSETUPS="${SKIP_ALLSETUPS:-false}"
SKIP_ALLFILES="${SKIP_ALLFILES:-false}"
FORCE_REINSTALL="${FORCE_REINSTALL:-false}"

## ─── Env defaults ──────────────────────────────────────────────────────────────
: "${ASTRBOT_USER:=astrbot}"
: "${ASTRBOT_GROUP:=astrbot}"
: "${ASTRBOT_HOME_DIR:=/var/lib/astrbot}"
: "${ASTRBOT_APP_DIR:=/opt/astrbot}"
: "${ASTRBOT_DATA_DIR:=/var/lib/astrbot}"
: "${ASTRBOT_CACHE_DIR:=/var/cache/astrbot}"
: "${ASTRBOT_CONFIG_DIR:=/etc/astrbot}"
: "${ASTRBOT_UPSTREAM:=https://github.com/AstrBotDevs/AstrBot.git}"
: "${ASTRBOT_BRANCH:=dev}"

## ─── Style helpers ─────────────────────────────────────────────────────────────
if command -v tput >/dev/null 2>&1 && [[ -n "$(tput colors 2>/dev/null)" ]]; then
  RST="$(tput sgr0)";  BOLD="$(tput bold)"
  DIM="$(tput dim)";   RED="$(tput setaf 1)";  GRN="$(tput setaf 2)"
  YEL="$(tput setaf 3)";CYN="$(tput setaf 6)";  ULN="$(tput smul)"
else
  RST="\033[0m"; BOLD="\033[1m"; DIM="\033[2m"
  RED="\033[31m"; GRN="\033[32m"; YEL="\033[33m"; CYN="\033[36m"; ULN="\033[4m"
fi

_log()   { printf '%s[%s]%s %s\n' "${DIM}" "$(date '+%H:%M:%S')" "${RST}" "$*"; }
info()   { printf '%sℹ%s %s\n' "${CYN}" "${RST}" "$*"; }
ok()     { printf '%s✔%s %s\n' "${GRN}" "${RST}" "$*"; }
warn()   { printf '%s⚠%s %s\n' "${YEL}" "${RST}" "$*" >&2; }
err()    { printf '%s✖%s %s\n' "${RED}" "${RST}" "$*" >&2; exit 1; }
need_cmd() { command -v "$1" >/dev/null 2>&1 || err "Required command not found: $1"; }

## ─── Privilege ────────────────────────────────────────────────────────────────
prevent_root() {
  if [[ "${EUID}" -eq 0 ]]; then
    err "Do NOT run as root. The installer asks for sudo when needed."
  fi
}
require_root() { sudo -n true 2>/dev/null || err "Root required. Run with sudo or as root."; }

sudo_keepalive() {
  [[ "${EUID}" -eq 0 ]] && return 0
  command -v sudo >/dev/null || err "sudo is required."
  sudo -v 2>/dev/null &
  sudo_pid=$!
}
sudo_release() { [[ -n "${sudo_pid:-}" ]] && kill "${sudo_pid}" 2>/dev/null || true; }
trap sudo_release EXIT INT TERM

## ─── Distro detection ─────────────────────────────────────────────────────────
detect_distro() {
  if [[ -f /etc/os-release ]]; then
    # shellcheck disable=SC1091
    source /etc/os-release
    DIST_ID="${ID:-unknown}"; DIST_ID_LIKE="${ID_LIKE:-}"; DIST_VER="${VERSION:-}"
  elif [[ -f /etc/redhat-release ]]; then DIST_ID="rhel"; DIST_ID_LIKE="rhel"
  elif [[ -f /etc/debian_version ]]; then DIST_ID="debian"; DIST_ID_LIKE="debian"
  else DIST_ID="unknown"; DIST_ID_LIKE=""
  fi
  case "${DIST_ID_LIKE}" in
    *debian*) DIST_FAM="debian" ;;
    *rhel*|*fedora*) DIST_FAM="rhel" ;;
    *arch*) DIST_FAM="arch" ;;
    *suse*) DIST_FAM="suse" ;;
    "") DIST_FAM="${DIST_ID}" ;;
    *) DIST_FAM="${DIST_ID}" ;;
  esac
  _log "Detected: ${DIST_ID} (${DIST_FAM}) ${DIST_VER}"
}

## ─── Package installers ────────────────────────────────────────────────────────
_install_deps_arch() {
  need_cmd pacman
  _log "Installing via pacman..."
  local pkgs=(python python-pip uv git certbot)
  # rustup provides cargo; do not install rust/cargo from official repos if rustup exists
  if ! command -v rustup >/dev/null 2>&1; then
    pkgs+=(rust cargo)
  fi
  sudo pacman -Sy --needed --noconfirm "${pkgs[@]}"
}

_install_deps_debian() {
  need_cmd apt-get
  _log "Installing via apt..."
  local pkgs=(python3 python3-pip python3-venv git certbot curl wget)
  sudo apt-get update -qq
  sudo apt-get install -y --no-install-recommends "${pkgs[@]}"
  if ! command -v rustc >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  fi
  if ! command -v uv >/dev/null 2>&1; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
  fi
}

_install_deps_rhel() {
  _log "Installing via dnf/yum..."
  if command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y python3 python3-pip git certbot curl
  else
    sudo yum install -y python3 python3-pip git certbot curl
  fi
  if ! command -v rustc >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  fi
  if ! command -v uv >/dev/null 2>&1; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
  fi
}

_install_deps_suse() {
  need_cmd zypper
  _log "Installing via zypper..."
  sudo zypper install -y python3 python3-pip git certbot curl rust
}

install_deps() {
  detect_distro
  case "${DIST_FAM}" in
    arch)     _install_deps_arch ;;
    debian)   _install_deps_debian ;;
    rhel)     _install_deps_rhel ;;
    suse)     _install_deps_suse ;;
    *)        warn "Unknown distro. Trying Debian approach..."; _install_deps_debian ;;
  esac
  need_cmd git; need_cmd python3
  ok "Dependencies installed."
}

## ─── Setup: users, dirs, permissions ─────────────────────────────────────────
setup_perms() {
  require_root
  _log "Creating user '${ASTRBOT_USER}'..."
  if ! getent passwd "${ASTRBOT_USER}" >/dev/null 2>&1; then
    sudo useradd -r -M -d "${ASTRBOT_HOME_DIR}" -s /usr/bin/nologin \
      -c "AstrBot Service User" "${ASTRBOT_USER}"
    ok "User created."
  else
    info "User already exists."
  fi

  _log "Creating directories..."
  sudo install -dm755 -o "${ASTRBOT_USER}" -g "${ASTRBOT_GROUP}" "${ASTRBOT_DATA_DIR}"
  sudo install -dm755 -o "${ASTRBOT_USER}" -g "${ASTRBOT_GROUP}" "${ASTRBOT_CACHE_DIR}"
  sudo install -dm755 -o "${ASTRBOT_USER}" -g "${ASTRBOT_GROUP}" "${ASTRBOT_CACHE_DIR}/python"
  sudo install -dm755 -o "${ASTRBOT_USER}" -g "${ASTRBOT_GROUP}" "${ASTRBOT_CACHE_DIR}/cargo"
  sudo install -dm755 -o "${ASTRBOT_USER}" -g "${ASTRBOT_GROUP}" "${ASTRBOT_CACHE_DIR}/rustup"
  sudo install -dm755 -o "${ASTRBOT_USER}" -g "${ASTRBOT_GROUP}" "${ASTRBOT_CACHE_DIR}/cargo_target"
  sudo install -dm755 -o root    -g root    "${ASTRBOT_CONFIG_DIR}"
  sudo install -dm755 -o root    -g root    "${ASTRBOT_APP_DIR}"
  ok "Directories created."

  _log "Setting ownership..."
  sudo chown -R "${ASTRBOT_USER}:${ASTRBOT_GROUP}" "${ASTRBOT_DATA_DIR}" "${ASTRBOT_CACHE_DIR}" 2>/dev/null || true
  git config --global --add safe.directory "${ASTRBOT_APP_DIR}" 2>/dev/null || true
  ok "Permissions set."
}

## ─── Files: clone app + install service ───────────────────────────────────────
install_files() {
  require_root
  _log "Cloning AstrBot (${ASTRBOT_BRANCH}) → ${ASTRBOT_APP_DIR}..."

  if mount | grep -q " ${ASTRBOT_APP_DIR} "; then
    info "Overlay mount detected — skipping clone (update in progress)."
  elif [[ -d "${ASTRBOT_APP_DIR}" ]]; then
    if [[ "${FORCE_REINSTALL}" == true ]]; then
      warn "Force reinstall — removing existing ${ASTRBOT_APP_DIR}"
      sudo rm -rf "${ASTRBOT_APP_DIR}"
    else
      info "${ASTRBOT_APP_DIR} already exists. Skipping clone."
      info "Use FORCE_REINSTALL=true to override."
    fi
  fi

  if [[ ! -d "${ASTRBOT_APP_DIR}" ]]; then
    _log "Downloading AstrBot (${ASTRBOT_BRANCH}) from GitHub..."
    local tarball="/tmp/astrbot-install-$$.tar.gz"
    local extract_dir="/tmp/astrbot-install-$$"
    local url="https://github.com/AstrBotDevs/AstrBot/archive/refs/heads/${ASTRBOT_BRANCH}.tar.gz"
    mkdir -p "$extract_dir"
    if ! curl -L --fail --silent --show-error -o "$tarball" "$url" 2>&1; then
      rm -f "$tarball"; rm -rf "$extract_dir"
      err "Failed to download AstrBot from GitHub."
    fi
    tar -xzf "$tarball" -C "$extract_dir" || \
      { rm -f "$tarball"; rm -rf "$extract_dir"; err "Failed to extract AstrBot tarball."; }
    local extracted
    extracted=$(find "$extract_dir" -mindepth 1 -maxdepth 1 -type d | head -1)
    mv "$extracted" "${ASTRBOT_APP_DIR}"
    rm -f "$tarball"; rm -rf "$extract_dir"
    # Init git repo so git describe works inside /opt/astrbot
    git -C "${ASTRBOT_APP_DIR}" init --quiet
    git -C "${ASTRBOT_APP_DIR}" remote add origin "${ASTRBOT_UPSTREAM}"
    git -C "${ASTRBOT_APP_DIR}" fetch --depth=1 origin "${ASTRBOT_BRANCH}" --quiet
    git -C "${ASTRBOT_APP_DIR}" checkout "${ASTRBOT_BRANCH}" --quiet
    # Write version file for AUR pkgver
    local _ver
    _ver=$(git -C "${ASTRBOT_APP_DIR}" describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g')
    [ -z "$_ver" ] && _ver="4.22.2"
    echo "$_ver" > "${ASTRBOT_APP_DIR}/.version"
    ok "Installed: ${ASTRBOT_APP_DIR} (${_ver})"
  fi

  _log "Installing management scripts..."
  if [[ -f "${REPO_ROOT}/astrbotctl" ]]; then
    sudo install -Dm755 "${REPO_ROOT}/astrbotctl" "/usr/bin/astrbotctl"
  else
    err "Missing astrbotctl in ${REPO_ROOT}"
  fi
  if [[ -f "${REPO_ROOT}/astrbotctl.functions" ]]; then
    sudo install -Dm644 "${REPO_ROOT}/astrbotctl.functions" "/usr/bin/astrbotctl.functions"
  else
    err "Missing astrbotctl.functions in ${REPO_ROOT}"
  fi
  if [[ -f "${REPO_ROOT}/tmpl.conf" ]]; then
    sudo install -Dm644 "${REPO_ROOT}/tmpl.conf" "${ASTRBOT_CONFIG_DIR}/tmpl.conf"
  else
    err "Missing tmpl.conf in ${REPO_ROOT}"
  fi
  ok "Management scripts installed."

  _log "Installing systemd service..."
  if [[ -f "${REPO_ROOT}/astrbot@.service" ]]; then
    sudo install -Dm644 "${REPO_ROOT}/astrbot@.service" \
      "/etc/systemd/system/astrbot@.service"
    sudo systemctl daemon-reload
    ok "systemd service installed."
  else
    err "Missing astrbot@.service in ${REPO_ROOT}"
  fi
}

## ─── Subcommands ────────────────────────────────────────────────────────────────
show_help() {
  printf '%s\n' ""
  printf '%s╔═══════════════════════════════════════════════════════╗%s\n' "${CYN}" "${RST}"
  printf '%s║%s        ✦ AstrBot Cross-Platform Installer ✦          %s║%s\n' "${CYN}" "${RST}" "${BOLD}${CYN}" "${RST}"
  printf '%s╠═══════════════════════════════════════════════════════╣%s\n' "${CYN}" "${RST}"
  printf '%s║%s  Supports: Arch / Debian / Ubuntu / RHEL / Fedora…    %s║%s\n' "${CYN}" "${RST}" "${DIM}" "${RST}"
  printf '%s╚═══════════════════════════════════════════════════════╝%s\n' "${CYN}" "${RST}"
  printf '%s\n' ""
  printf '  %s./setup.sh%s          Install / Refresh AstrBot\n' "${GRN}" "${RST}"
  printf '  %s./setup.sh deps%s     Step 1 — Install system dependencies\n' "${GRN}" "${RST}"
  printf '  %s./setup.sh setups%s    Step 2 — Setup users, dirs, permissions\n' "${GRN}" "${RST}"
  printf '  %s./setup.sh files%s    Step 3 — Install app, astrbotctl, and service\n' "${GRN}" "${RST}"
  printf '  %s./setup.sh help%s     Show this help\n' "${GRN}" "${RST}"
  printf '%s\n' ""
  printf '  %sNOTE:%s  Run %swithout sudo%s — the installer asks when needed.\n' "${YEL}" "${RST}" "${BOLD}" "${RST}"
  printf '%s\n' ""
}

show_banner() {
  printf '\n%s╔═══════════════════════════════════════════════════════════╗%s\n' "${CYN}" "${RST}"
  printf '%s║%s            ✦ AstrBot Cross-Platform Installer ✦              %s║%s\n' "${CYN}" "${RST}" "${BOLD}${CYN}" "${RST}"
  printf '%s╠═══════════════════════════════════════════════════════════╣%s\n' "${CYN}" "${RST}"
  printf '%s║%s  Multi-instance AI chatbot  ·  Discord · Telegram · …      %s║%s\n' "${CYN}" "${RST}" "${DIM}" "${RST}"
  printf '%s╠═══════════════════════════════════════════════════════════╣%s\n' "${CYN}" "${RST}"
  printf '%s║%s  GitHub: %shttps://github.com/AstrBotDevs/AstrBot%s              %s║%s\n' \
    "${CYN}" "${RST}" "${ULN}${CYN}" "${RST}" "${CYN}" "${RST}"
  printf '%s╚═══════════════════════════════════════════════════════════╝%s\n' "${CYN}" "${RST}"
  printf '\n'
}


pause() { [[ "${CI:-false}" == true ]] && return 0; printf '\n%sPress %sENTER%s to continue...%s\n' "${DIM}" "${BOLD}" "${RST}" "${DIM}"; read -r _ </dev/tty; }

## ─── Main dispatch ─────────────────────────────────────────────────────────────
prevent_root

case "${1:-install}" in
  ""|install)
    sudo_keepalive
    [[ "${SKIP_ALLGREETING}" != true ]] && show_banner
    [[ "${SKIP_ALLDEPS}"    != true ]] && { install_deps; pause; }
    [[ "${SKIP_ALLSETUPS}"  != true ]] && { setup_perms; pause; }
    [[ "${SKIP_ALLFILES}"   != true ]] && install_files
    printf '\n'
    ok "AstrBot is ready!"
    printf '\n  %sCreate an instance:%s    %ssudo astrbotctl init <name>%s\n' "${BOLD}" "${RST}" "${GRN}" "${RST}"
    printf '  %sStart service:%s         %ssudo astrbotctl start <name>%s\n' "${BOLD}" "${RST}" "${GRN}" "${RST}"
    printf '  %sForeground debug:%s      %ssudo astrbotctl run <name>%s\n' "${BOLD}" "${RST}" "${GRN}" "${RST}"
    printf '  %sEnable on boot:%s        %ssudo systemctl enable --now astrbot@<name>%s\n' "${BOLD}" "${RST}" "${GRN}" "${RST}"
    printf '  %sUpdate code + venv:%s      %sparu -S astrbot-git%s（自动重建 venv）\n' "${BOLD}" "${RST}" "${GRN}" "${RST}"
    printf '  %sIf venv not synced:%s      %ssudo astrbotctl sync <name>%s\n' "${BOLD}" "${RST}" "${GRN}" "${RST}"
    printf '  %sLock file:%s             %sASTRBOT_ROOT/astrbot.lock%s\n' "${BOLD}" "${RST}" "${GRN}" "${RST}"
    printf '  %sRemove stale lock:%s     %ssudo rm -f /var/lib/astrbot/<name>/astrbot.lock%s\n' "${BOLD}" "${RST}" "${GRN}" "${RST}"
    printf '  %sDocs:%s                   %shttps://docs.astrbot.app%s\n' "${BOLD}" "${RST}" "${CYN}" "${RST}"
    printf '\n'
    ;;
  deps)     install_deps ;;
  setups)    sudo_keepalive; setup_perms ;;
  files)     sudo_keepalive; install_files ;;
  help|--help|-h) show_help ;;
  *)         err "Unknown subcommand: $1  (try: ./setup.sh help)" ;;
esac
