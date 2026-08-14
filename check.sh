#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

release_check=false
if [[ "${1:-}" == "--release" ]]; then
  release_check=true
elif [[ $# -gt 0 ]]; then
  printf 'usage: %s [--release]\n' "$0" >&2
  exit 2
fi

fail() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

command -v makepkg >/dev/null || fail 'makepkg is required'

tmp_srcinfo="$(mktemp)"
trap 'rm -f "$tmp_srcinfo"' EXIT

makepkg --printsrcinfo > "$tmp_srcinfo"
diff -u .SRCINFO "$tmp_srcinfo"

grep -q '^pkgname=gitcommitgenerator-bin$' PKGBUILD || fail 'pkgname must match repository name'
grep -Eq '^pkgver=[0-9]+\.[0-9]+\.[0-9]+$' PKGBUILD || fail 'pkgver must be a stable upstream version'
grep -q "provides=(\"\${_pkgname}=\${pkgver}\")" PKGBUILD || fail 'binary package must provide gitcommitgenerator'
grep -q "conflicts=(\"\${_pkgname}\")" PKGBUILD || fail 'binary package must conflict with gitcommitgenerator'
grep -q 'releases/download/v${pkgver}' PKGBUILD || fail 'source must use versioned GitHub releases'
grep -q 'install -Dm755' PKGBUILD || fail 'package() must install the binary'
grep -q 'install -Dm644.*LICENSE' PKGBUILD || fail 'package() must install the license'

if [[ "$release_check" == true ]]; then
  ! grep -q "sha256sums_x86_64=('SKIP')" PKGBUILD || fail 'replace SKIP with the real release asset checksum before publishing'
  makepkg --force --verifysource
fi

package_tmp="$(mktemp -d)"
trap 'rm -f "$tmp_srcinfo"; rm -rf "$package_tmp"' EXIT

(
  CARCH="${CARCH:-x86_64}"
  source PKGBUILD

  srcdir="${package_tmp}/src"
  pkgdir="${package_tmp}/pkg"
  mkdir -p "$srcdir" "$pkgdir"

  printf '#!/bin/sh\nexit 0\n' > "${srcdir}/${_pkgname}"
  chmod +x "${srcdir}/${_pkgname}"
  printf 'MIT License\n' > "${srcdir}/LICENSE-${pkgver}"

  package

  [[ -x "${pkgdir}/usr/bin/${_pkgname}" ]] || fail 'package() did not install an executable binary'
  [[ -f "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" ]] || fail 'package() did not install the license'
)

if command -v namcap >/dev/null; then
  namcap PKGBUILD
else
  printf 'warning: namcap not found; skipping namcap PKGBUILD check\n' >&2
fi

printf 'AUR packaging checks passed.\n'
