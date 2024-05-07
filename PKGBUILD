# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=mixerdialog
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple application to control system volume with fancy visualisation"
arch=('x86_64')
url="https://github.com/govnorice/mixerdialog"
options=(!lto)
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'gtk3'
  'alsa-lib'
  'alsa-utils'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=("https://github.com/govnorice/mixerdialog/releases/download/$pkgver/mixerdialog")
sha256sums=('SKIP')
build() {
  :
}
package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/mixerdialog" "$pkgdir/usr/bin/mixerdialog"
  chmod +x "$pkgdir/usr/bin/mixerdialog"
}
