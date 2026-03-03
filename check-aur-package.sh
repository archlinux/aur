#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_root"

required_files=(
  PKGBUILD
  .SRCINFO
  prepare-overlay.sh
  fido2-manage.desktop
  fido2-manage.png
  LICENSE
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "ERROR: required file missing: $file" >&2
    exit 1
  fi
done

# Basic syntax and metadata sanity.
bash -n PKGBUILD prepare-overlay.sh

grep -Eq '^pkgname=.*-git$' PKGBUILD || {
  echo "ERROR: VCS package should use a -git pkgname" >&2
  exit 1
}
grep -Eq '^pkgver=r0\.0$' PKGBUILD || {
  echo "ERROR: VCS package should start with pkgver=r0.0" >&2
  exit 1
}
grep -Eq '^pkgrel=[1-9][0-9]*$' PKGBUILD || {
  echo "ERROR: pkgrel must be a positive integer" >&2
  exit 1
}
if grep -q 'Your Name <you@example.com>' PKGBUILD; then
  echo "ERROR: maintainer placeholder still present in PKGBUILD" >&2
  exit 1
fi
if grep -Eq '^replaces=' PKGBUILD; then
  echo "ERROR: avoid replaces= in AUR packages unless absolutely required" >&2
  exit 1
fi

if command -v desktop-file-validate >/dev/null 2>&1; then
  desktop-file-validate fido2-manage.desktop
fi

# Keep .SRCINFO in sync with PKGBUILD.
tmp_srcinfo="$(mktemp)"
trap 'rm -f "$tmp_srcinfo"' EXIT
makepkg --printsrcinfo > "$tmp_srcinfo"

if ! cmp -s "$tmp_srcinfo" .SRCINFO; then
  echo "INFO: .SRCINFO was out of sync; updating it now"
  cp "$tmp_srcinfo" .SRCINFO
fi

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git add .SRCINFO >/dev/null 2>&1 || true
fi

# Optional static analysis.
if command -v shellcheck >/dev/null 2>&1; then
  shellcheck prepare-overlay.sh check-aur-package.sh || {
    echo "ERROR: shellcheck reported issues" >&2
    exit 1
  }
fi

if command -v namcap >/dev/null 2>&1; then
  # Evaluate PKGBUILD first.
  namcap_output="$(namcap PKGBUILD 2>&1 || true)"
  if [[ -n "$namcap_output" ]]; then
    echo "$namcap_output"
  fi
  if grep -q ' E: ' <<<"$namcap_output"; then
    echo "ERROR: namcap reported PKGBUILD errors" >&2
    exit 1
  fi

  latest_pkg="$(ls -1t ./*.pkg.tar.* 2>/dev/null | head -n1 || true)"
  if [[ -n "$latest_pkg" ]]; then
    pkg_namcap_output="$(namcap "$latest_pkg" 2>&1 || true)"
    if [[ -n "$pkg_namcap_output" ]]; then
      echo "$pkg_namcap_output"
    fi
    if grep -q ' E: ' <<<"$pkg_namcap_output"; then
      echo "ERROR: namcap reported package errors" >&2
      exit 1
    fi
  fi
fi

# Submission-guideline checks (informational, no hard fail).
pkgname="$(sed -n 's/^pkgname=//p' PKGBUILD | head -n1 | tr -d "'\"")"
if command -v pacman >/dev/null 2>&1; then
  if pacman -Si "$pkgname" >/dev/null 2>&1; then
    echo "WARN: package name '$pkgname' exists in official repos; verify naming before AUR submit"
  fi
fi
if command -v curl >/dev/null 2>&1; then
  aur_result="$(curl -fsS "https://aur.archlinux.org/rpc/?v=5&type=search&arg=${pkgname}" || true)"
  if [[ "$aur_result" =~ '"resultcount":0' ]]; then
    echo "INFO: no existing AUR package found for '${pkgname}'"
  fi
fi

# Optional strict check: build in a clean chroot (recommended by ArchWiki).
# Enable explicitly on a host where devtools+sudo are configured:
#   AUR_CHECK_CHROOT=1 ./check-aur-package.sh
if [[ "${AUR_CHECK_CHROOT:-0}" == "1" ]]; then
  if command -v extra-x86_64-build >/dev/null 2>&1; then
    extra-x86_64-build -- --nocheck
  else
    echo "ERROR: AUR_CHECK_CHROOT=1 requested, but extra-x86_64-build is not installed" >&2
    exit 1
  fi
else
  echo "INFO: clean chroot build check skipped (set AUR_CHECK_CHROOT=1 to enable)"
fi

echo "AUR package checks completed successfully"
