# Maintainer: dreieck

_pkgname=hex2dec
pkgname="${_pkgname}"
pkgver=20231128.01
pkgrel=1
pkgdesc="Prints information about system batteries and power supplies to the terminal, optionally also from devices connected via KDE Connect."
url="https://gitlab.com/dreieckli/linux-terminal-battery-status"
license=(
  'GPL3'
)
arch=(
  "any"
)
depends=(
  'bash'
)
optdepends=()
makedepends=()
provides=()
conflicts=()
source=(
  "hex2dec"
)
sha256sums=(
  'd7463913dd7a83e1733f38f2f5322bd099082eda3eea63247d53a20ffe114311'
)

pkgver() {
  printf '%s' "$("${srcdir}/hex2dec" --version)"
}

package() {
  install -Dvm755 "${srcdir}/hex2dec" "${pkgdir}/usr/bin/hex2dec"
}
