# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=faint
pkgdesc="Extensible TUI fuzzy file explorer"
pkgver=0.97
pkgrel=1
arch=('x86_64')
url="https://github.com/salman-abedin/faint"
license=('unknown')
depends=('fzf')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a16b24d09af92f13045514fb6a5344ca232f68d72fe1d2a86a40112af71494bc')

package() {
  cd "$pkgname-$pkgver"
  make BIN_DIR="$pkgdir/usr/bin" install
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
