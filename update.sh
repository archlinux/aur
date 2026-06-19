#!/usr/bin/env bash
set -euo pipefail

REPO=git@gitlab.archlinux.org:archlinux/packaging/packages/linux.git
WSLCFG=https://raw.githubusercontent.com/microsoft/WSL2-Linux-Kernel/refs/heads/linux-msft-wsl-6.18.y/arch/x86/configs/config-wsl
NAME='HsingYun'
EMAIL='iakext@gmail.com'

step() { echo "==> $*"; }

ensure_ignore() {
  local pat=$1
  if ! { [[ -f .gitignore ]] && grep -qxF "$pat" .gitignore; }; then
    echo "$pat" >> .gitignore
  fi
}

cd "$(dirname "$(readlink -f "$0")")"

step "[0/7] checking prerequisites"
for c in git curl makepkg updpkgsums awk sed find; do
  command -v "$c" >/dev/null || { echo "missing dependency: $c" >&2; exit 1; }
done
[[ $EUID -ne 0 ]] || { echo "do not run makepkg as root" >&2; exit 1; }
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "not inside a git work tree" >&2; exit 1; }

tmpd=""
err_line=0
trap 'err_line=$LINENO' ERR
on_exit() {
  local rc=$?
  [[ -n $tmpd ]] && rm -rf "$tmpd" 2>/dev/null || true
  if (( rc != 0 )); then
    echo "==> FAILED at line $err_line (exit $rc); rolling back work tree." >&2
    git rev-parse --verify -q HEAD >/dev/null 2>&1 && git reset --hard HEAD >/dev/null 2>&1 || true
    git clean -fd -e update.sh >/dev/null 2>&1 || true
    echo "==> rolled back to last commit; see the error above for the failing step." >&2
  fi
}
trap on_exit EXIT

step "[1/7] wiping work tree down to .git + update.sh"
find . -mindepth 1 -maxdepth 1 ! -name .git ! -name update.sh -exec rm -rf {} +

step "[2/7] cloning Arch linux package: $REPO"
tmpd=$(mktemp -d)
git clone --depth=1 "$REPO" "$tmpd"
step "[2/7] copying package contents into work tree"
find "$tmpd" -mindepth 1 -maxdepth 1 ! -name .git -exec cp -rt . {} +

step "[3/7] fetching Microsoft config-wsl -> config.x86_64"
curl -fsSL "$WSLCFG" -o config.x86_64
step "[3/7] rewriting PKGBUILD (pkgbase, pkgdesc, provenance note, Maintainer/Contributor, drop replaces)"
{
  echo "# Maintainer: $NAME <$EMAIL>"
  echo "#"
  echo "# Built from the official Arch Linux 'linux' package sources, with only the kernel"
  echo "# config replaced by the Microsoft WSL config (config-wsl). No Microsoft out-of-tree"
  echo "# patches are applied (notably no dxgkrnl); the kernel source is identical to the"
  echo "# official linux package."
  awk '
    /^# Maintainer:/ {sub(/^# Maintainer:/, "# Contributor:"); print; next}
    /^[[:space:]]*replaces=\(/ {r=1; next}
    r && /^[[:space:]]*\)/ {r=0; next}
    r {next}
    {print}
  ' PKGBUILD \
  | sed -e 's/^pkgbase=linux$/pkgbase=linux-wsl/' \
        -e "s/^pkgdesc='Linux'\$/pkgdesc='Linux (WSL without Microsoft out-of-tree patches)'/"
} > PKGBUILD.new && mv PKGBUILD.new PKGBUILD

step "[4/7] updating checksums (updpkgsums)"
updpkgsums

step "[5/7] generating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO

step "[6/7] staging changes"
ensure_ignore '/pkg'
ensure_ignore '/src'
ensure_ignore 'linux-*'
git add .gitignore
git add -A
if git rev-parse --verify -q HEAD >/dev/null 2>&1 && git diff --cached --quiet; then
  step "[7/7] already up to date; nothing to commit."
  exit 0
fi
ver=$(awk -F= '/^pkgver=/{print $2; exit}' PKGBUILD)
rel=$(awk -F= '/^pkgrel=/{print $2; exit}' PKGBUILD)
step "[7/7] signed commit: linux-wsl $ver-$rel"
git -c user.name="$NAME" -c user.email="$EMAIL" commit -S -m "Sync to Arch linux $ver-$rel"
step "OK: committed (signed) $ver-$rel. Not pushed."
