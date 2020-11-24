# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=faint
pkgdesc="Extensible TUI fuzzy file explorer"
pkgver=0.996
pkgrel=1
arch=('x86_64')
url="https://github.com/salman-abedin/faint"
license=('GPL2')
depends=('fzf')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cc1beb925befb0d38da4bf427cdfa74eb7d11727de2aeecc7f023ca82810c48a')

package() {
  cd "$pkgname-$pkgver"
  make BIN_DIR="$pkgdir/usr/bin" install
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
