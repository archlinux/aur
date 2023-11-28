# Maintainer: dreieck

_pkgname=dec2hex
pkgname="${_pkgname}"
pkgver=20231128.01
pkgrel=1
pkgdesc="Converts decimal numbers to hexadecimal numbers using only sh."
url="https://aur.archlinux.org/packages/dec2hex"
license=(
  'GPL3'
)
arch=(
  "any"
)
depends=(
  'sh'
)
optdepends=(
  "hex2dec: To convert the other way round: From hexadecimal to decimal."
)
makedepends=()
provides=()
conflicts=()
source=(
  "dec2hex"
)
sha256sums=(
  'b2145ccc5f2d973dc1ff9a7d36b58970032c92e0b8174f05f72ea5ad0e1f4858'
)

pkgver() {
  printf '%s' "$("${srcdir}/dec2hex" --version)"
}

package() {
  install -Dvm755 "${srcdir}/dec2hex" "${pkgdir}/usr/bin/dec2hex"
}
