# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=faint
pkgdesc="Extensible TUI fuzzy file explorer"
pkgver=0.99
pkgrel=1
arch=('x86_64')
url="https://github.com/salman-abedin/faint"
license=('unknown')
depends=('fzf')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a4f8d07159808f8adaeaed162ec02c5d8dcdc805d3a49266a5de614a3d2e88db')

package() {
  cd "$pkgname-$pkgver"
  make BIN_DIR="$pkgdir/usr/bin" install
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
