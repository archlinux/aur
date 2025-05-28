# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=archarchive
pkgver=1.2.0
pkgrel=1
pkgdesc="A utility to quickly rollback an arch linux system using ALA (a.k.a Arch Linux Archive)"
arch=('x86_64')
url="https://github.com/progzone122/archarchive"
options=(!lto)
license=('GPL-3.0-or-later')
depends=()
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=("https://github.com/progzone122/archarchive/releases/download/$pkgver/archarchive")
sha256sums=('SKIP')
build() {
  :
}
package() {
  install -Dm755 "$srcdir/archarchive" "$pkgdir/usr/bin/archarchive"
}
