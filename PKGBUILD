# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=archarchive
pkgver=1.0.0
pkgrel=3
pkgdesc="A utility to quickly rollback an arch linux system using ALA (a.k.a Arch Linux Archive)"
arch=('x86_64')
url="https://github.com/govnorice/archarchive"
options=(!lto)
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=("https://github.com/govnorice/archarchive/releases/download/$pkgver/pizdec")
sha256sums=('SKIP')
build() {
  :
}
package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/pizdec" "$pkgdir/usr/bin/pizdec"
  chmod +x "$pkgdir/usr/bin/pizdec"
}
