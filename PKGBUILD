# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=faint
pkgdesc="Extensible TUI fuzzy file explorer"
pkgver=0.98
pkgrel=1
arch=('x86_64')
url="https://github.com/salman-abedin/faint"
license=('unknown')
depends=('fzf')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('53a3b862c7c84d05bc6ca31b6a2865cf34f6459e2ed194ba6e0d4277353de419')

package() {
  cd "$pkgname-$pkgver"
  make BIN_DIR="$pkgdir/usr/bin" install
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
