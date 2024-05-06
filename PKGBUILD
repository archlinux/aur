# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=powerdialog
pkgver=0.2.3
pkgrel=1
pkgdesc="GUI gtk3 dialogue of shutdown, logout, sleep, reboot PC"
arch=('x86_64')
url="https://github.com/govnorice/powerdialog"
options=(!lto)
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'gtk3'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=("https://github.com/govnorice/powerdialog/releases/download/$pkgver/powerdialog")
sha256sums=('SKIP')
build() {
  :
}
package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/powerdialog" "$pkgdir/usr/bin/powerdialog"
  chmod +x "$pkgdir/usr/bin/powerdialog"
}
