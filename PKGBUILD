# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=fortfetch
pkgver=0.1.1
pkgrel=1
pkgdesc="Самый фортуно-потужний фаст блейзинговый раст фетч во всей вселенной"
arch=('x86_64')
url="https://github.com/progzone122/fortfetch"
options=(!lto)
license=('GPL-3.0-or-later')
depends=()
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=("https://github.com/progzone122/fortfetch/releases/download/$pkgver/fortfetch")
sha256sums=('SKIP')
build() {
  :
}
package() {
  install -Dm755 "$srcdir/fortfetch" "$pkgdir/usr/bin/fortfetch"
}
