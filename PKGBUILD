# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=repackmanga
pkgver=0.2
pkgrel=1
pkgdesc="Repackaging archives into a manga conversion structure via KCC (a.k.a. Kindle Comic Converter)"
arch=('x86_64')
url="https://github.com/govnorice/repackmanga"
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
source=("https://github.com/govnorice/repackmanga/releases/download/$pkgver/repackmanga")
sha256sums=('SKIP')
build() {
  :
}
package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/repackmanga" "$pkgdir/usr/bin/repackmanga"
  chmod +x "$pkgdir/usr/bin/repackmanga"
}
