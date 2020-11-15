# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=faint
pkgdesc="Extensible TUI fuzzy file explorer"
pkgver=0.991
pkgrel=1
arch=('x86_64')
url="https://github.com/salman-abedin/faint"
license=('unknown')
depends=('fzf')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9e2d0fd3a6df3a349bf116fc767a2b75a5dc51c0b0c15147a7f4e6699d1354ea')

package() {
  cd "$pkgname-$pkgver"
  make BIN_DIR="$pkgdir/usr/bin" install
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
