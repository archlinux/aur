# Contributor: orhun <orhunparmaksiz@gmail.com>

pkgname=faint
pkgdesc="Extensible TUI fuzzy file explorer"
pkgver=1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/salman-abedin/faint"
license=('GPL2')
depends=('fzf')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e0556c0326f2f91ee944b2353fc83123ec470b7ca2a512ce2385926913383a47')

package() {
  cd "$pkgname-$pkgver"
  make BIN_DIR="$pkgdir/usr/bin" install
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
