# Maintainer: uwiwiow <uwiwiow@gmail.com>

pkgname=clay
pkgver=0.13
pkgrel=1
pkgdesc="Header-only high performance UI layout library in C"
arch=('any')
url="https://github.com/nicbarker/${pkgname}"
license=('Zlib')
depends=()
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4b0e765e1b60cdcbdf25bf2f76a914f9f5dbee40900c261d691ce3fa46d3870')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 clay.h -t "$pkgdir/usr/include"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
