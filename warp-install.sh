#!/bin/sh
# Cloudflare WARP installer for the GambiarraInfinite Linux port.
#
# Detects the distribution and installs cloudflare-warp through pkexec (the
# desktop asks for the administrator password; this script never sees it).
#
# Usage:
#   warp-install.sh --detect    print {distro,family,manager,downloadUrl}
#   warp-install.sh --url       print the fallback download page
#   warp-install.sh --install   install and print one JSON result object
#
# Test hooks:
#   WARP_OS_RELEASE=<file>   use this instead of /etc/os-release
#   WARP_DRY_RUN=1           log the commands, run nothing privileged
#   WARP_FORCE_REPO=1        treat an Arch system as having cloudflare-warp-bin
#   WARP_FORCE_AUR=1         treat an Arch system as AUR-only
#   WARP_NO_MANAGER=1        force unknown family/manager
set -u

MODE="${1:---install}"
OS_RELEASE="${WARP_OS_RELEASE:-/etc/os-release}"
AUR_SNAPSHOT="https://aur.archlinux.org/cgit/aur.git/snapshot/cloudflare-warp-bin.tar.gz"
CF_PAGE="https://pkg.cloudflareclient.com/"
AUR_PAGE="https://aur.archlinux.org/packages/cloudflare-warp-bin"
DRY="${WARP_DRY_RUN:-0}"

LOG="$(mktemp 2>/dev/null || echo /tmp/gambiarra-warp-install.log)"
: >"$LOG" 2>/dev/null || LOG=/dev/null
trap 'rm -f "$LOG" 2>/dev/null; [ -n "${WORKDIR:-}" ] && rm -rf "$WORKDIR"' EXIT

log() { printf '%s\n' "$*" >>"$LOG" 2>/dev/null; }

esc() { # JSON string escaping for a single line
  printf '%s' "$1" | tr '\n' ' ' | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g'
}

read_os() {
  ID=""
  ID_LIKE=""
  VERSION_CODENAME=""
  if [ -r "$OS_RELEASE" ]; then
    # shellcheck disable=SC1090
    . "$OS_RELEASE" 2>/dev/null || true
  fi
  ID="${ID:-}"
  ID_LIKE="${ID_LIKE:-}"
  VERSION_CODENAME="${VERSION_CODENAME:-}"
}

family() {
  if [ "${WARP_NO_MANAGER:-0}" = "1" ]; then
    echo unknown
    return
  fi
  case " $ID $ID_LIKE " in
    *arch*|*cachyos*|*endeavouros*|*manjaro*) echo arch; return ;;
  esac
  case " $ID $ID_LIKE " in
    *debian*|*ubuntu*) echo debian; return ;;
  esac
  case " $ID $ID_LIKE " in
    *fedora*|*rhel*|*centos*) echo fedora; return ;;
  esac
  case " $ID $ID_LIKE " in
    *suse*|*opensuse*) echo suse; return ;;
  esac
  if command -v pacman >/dev/null 2>&1; then echo arch; return; fi
  if command -v apt-get >/dev/null 2>&1; then echo debian; return; fi
  if command -v dnf >/dev/null 2>&1 || command -v yum >/dev/null 2>&1; then echo fedora; return; fi
  if command -v zypper >/dev/null 2>&1; then echo suse; return; fi
  echo unknown
}

arch_has_repo_pkg() {
  [ "${WARP_FORCE_AUR:-0}" = "1" ] && return 1
  [ "${WARP_FORCE_REPO:-0}" = "1" ] && return 0
  command -v pacman >/dev/null 2>&1 && pacman -Si cloudflare-warp-bin >/dev/null 2>&1
}

manager_for() {
  case "$1" in
    arch) if arch_has_repo_pkg; then echo pacman; else echo aur; fi ;;
    debian) echo apt ;;
    fedora) if command -v dnf >/dev/null 2>&1 || ! command -v yum >/dev/null 2>&1; then echo dnf; else echo yum; fi ;;
    suse) echo zypper ;;
    *) echo none ;;
  esac
}

url_for() {
  case "$1" in
    arch) echo "$AUR_PAGE" ;;
    *) echo "$CF_PAGE" ;;
  esac
}

run() { # run <label> <cmd...>
  log "==> $1"
  shift
  log "    $*"
  if [ "$DRY" = "1" ]; then
    log "    (dry run)"
    return 0
  fi
  "$@"
}

priv() {
  if [ -z "${PRIV:-}" ]; then
    log "error: pkexec not found; cannot elevate"
    return 127
  fi
  "$PRIV" "$@"
}

notify() {
  [ "$DRY" = "1" ] && return 0
  command -v notify-send >/dev/null 2>&1 || return 0
  notify-send -a GambiarraInfinite "Cloudflare WARP" "$1" >/dev/null 2>&1 || true
}

fail() { # fail <message>
  ERROR="$1"
  return 1
}

# --------------------------------------------------------------------------
# installers
# --------------------------------------------------------------------------

install_arch() {
  if arch_has_repo_pkg; then
    run "install cloudflare-warp-bin" priv pacman -S --noconfirm --needed cloudflare-warp-bin || fail "pacman install failed"
  else
    install_arch_aur
  fi
}

install_arch_aur() {
  WORKDIR="$(mktemp -d 2>/dev/null)" || return 1
  if [ "$DRY" != "1" ]; then
    run "download AUR snapshot" curl -fsSL -o "$WORKDIR/aur.tar.gz" "$AUR_SNAPSHOT" || fail "could not download the AUR snapshot"
    run "extract AUR snapshot" tar -xzf "$WORKDIR/aur.tar.gz" -C "$WORKDIR" || fail "could not extract the AUR snapshot"
  else
    log "==> download AUR snapshot"
    log "    curl -fsSL -o $WORKDIR/aur.tar.gz $AUR_SNAPSHOT"
    log "==> extract AUR snapshot"
    log "    tar -xzf $WORKDIR/aur.tar.gz -C $WORKDIR"
  fi
  ADIR="$WORKDIR/cloudflare-warp-bin"
  if [ "$DRY" != "1" ] && [ ! -d "$ADIR" ]; then
    fail "AUR snapshot missing cloudflare-warp-bin"
    return 1
  fi
  run "install build dependencies" priv pacman -S --noconfirm --needed base-devel chrpath || fail "could not install build dependencies"
  if [ -f "$ADIR/.SRCINFO" ]; then
    deps="$(sed -n 's/^[[:space:]]*depends = //p' "$ADIR/.SRCINFO" | tr '\n' ' ')"
    if [ -n "$deps" ]; then
      # shellcheck disable=SC2086
      run "install runtime dependencies" priv pacman -S --noconfirm --needed $deps || fail "could not install runtime dependencies"
    fi
  fi
  if [ "$DRY" = "1" ]; then
    run "build AUR package" makepkg --noconfirm --nocheck
    pkg="$ADIR/cloudflare-warp-bin-dryrun.pkg.tar.zst"
  else
    ( cd "$ADIR" && run "build AUR package" makepkg --noconfirm --nocheck ) || fail "makepkg failed"
    pkg="$(ls "$ADIR"/cloudflare-warp-bin-*.pkg.tar.* 2>/dev/null | head -n 1)"
    [ -n "$pkg" ] || fail "makepkg produced no package"
  fi
  run "install built package" priv pacman -U --noconfirm "$pkg" || fail "pacman -U failed"
}

install_debian() {
  codename="$VERSION_CODENAME"
  if [ -z "$codename" ]; then
    codename="$(lsb_release -cs 2>/dev/null || true)"
  fi
  case "$codename" in
    ""|*[!a-z0-9]*) fail "could not determine a safe Debian/Ubuntu codename"; return 1 ;;
  esac
  script="set -e
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y curl gpg ca-certificates
install -d /usr/share/keyrings
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $codename main' > /etc/apt/sources.list.d/cloudflare-client.list
apt-get update
apt-get install -y cloudflare-warp"
  run "install cloudflare-warp" priv sh -c "$script" || fail "apt install failed"
}

install_fedora() {
  pm="dnf"
  if ! command -v dnf >/dev/null 2>&1 && command -v yum >/dev/null 2>&1; then
    pm="yum"
  fi
  epel=""
  case "$ID" in
    rhel|centos|rocky|almalinux) epel="$pm install -y epel-release || true
" ;;
  esac
  script="set -e
curl -fsSL https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo -o /etc/yum.repos.d/cloudflare-warp.repo
${epel}$pm install -y cloudflare-warp"
  run "install cloudflare-warp" priv sh -c "$script" || fail "$pm install failed"
}

install_suse() {
  script="set -e
zypper --non-interactive addrepo --refresh https://pkg.cloudflareclient.com/ cloudflare-warp || true
zypper --non-interactive --gpg-auto-import-keys refresh
zypper --non-interactive install cloudflare-warp"
  run "install cloudflare-warp" priv sh -c "$script" || fail "zypper install failed"
}

# --------------------------------------------------------------------------
# result
# --------------------------------------------------------------------------

result() { # result <true|false> [error]
  ok="$1"
  error="${2:-}"
  installed=false
  if command -v warp-cli >/dev/null 2>&1 || [ -x /usr/bin/warp-cli ]; then
    installed=true
  fi
  [ "$DRY" = "1" ] && installed=false
  extra=""
  [ "$DRY" = "1" ] && extra=',"dryRun":true'
  printf '{"ok":%s,"installed":%s,"distro":"%s","family":"%s","manager":"%s","error":"%s","downloadUrl":"%s","log":"%s"%s}\n' \
    "$ok" "$installed" \
    "$(esc "$ID")" "$(esc "$FAMILY")" "$(esc "$MANAGER")" \
    "$(esc "$error")" "$(esc "$URL")" \
    "$(esc "$(tail -c 1800 "$LOG" 2>/dev/null)")" "$extra"
}

case "$MODE" in
  --detect)
    read_os
    FAMILY="$(family)"
    MANAGER="$(manager_for "$FAMILY")"
    URL="$(url_for "$FAMILY")"
    printf '{"distro":"%s","family":"%s","manager":"%s","downloadUrl":"%s"}\n' \
      "$(esc "$ID")" "$(esc "$FAMILY")" "$(esc "$MANAGER")" "$(esc "$URL")"
    ;;
  --url)
    read_os
    url_for "$(family)"
    ;;
  --install)
    read_os
    FAMILY="$(family)"
    MANAGER="$(manager_for "$FAMILY")"
    URL="$(url_for "$FAMILY")"
    ERROR=""
    PRIV=""
    if command -v pkexec >/dev/null 2>&1; then
      PRIV="pkexec"
    fi
    log "distro=$ID family=$FAMILY manager=$MANAGER dryRun=$DRY pkexec=${PRIV:-none}"
    notify "Installing Cloudflare WARP..."
    case "$FAMILY" in
      arch) install_arch ;;
      debian) install_debian ;;
      fedora) install_fedora ;;
      suse) install_suse ;;
      *) fail "unsupported distribution (no supported package manager found)" ;;
    esac || rc=$?
    if [ "${rc:-0}" != "0" ] && [ -z "$ERROR" ]; then
      ERROR="install step failed (exit $rc); see the log"
    fi
    if [ -n "$ERROR" ]; then
      notify "Cloudflare WARP install failed: $ERROR"
      result false "$ERROR"
      exit 0
    fi
    if [ "${PRIV:-}" = "" ] && [ "$DRY" != "1" ]; then
      notify "Cloudflare WARP install failed: pkexec not found"
      result false "pkexec not found; install policykit to get a password prompt"
      exit 0
    fi
    if [ "$DRY" != "1" ]; then
      run "enable warp service" priv systemctl enable --now warp-svc >/dev/null 2>&1 || true
      if command -v warp-cli >/dev/null 2>&1 || [ -x /usr/bin/warp-cli ]; then
        notify "Cloudflare WARP installed"
      else
        notify "Cloudflare WARP installed, but warp-cli was not found"
      fi
    fi
    result true ""
    ;;
  *)
    echo "usage: $0 [--detect|--url|--install]" >&2
    exit 2
    ;;
esac
