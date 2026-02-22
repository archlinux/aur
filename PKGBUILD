# Maintainer: uwiwiow <uwiwiow@gmail.com>

pkgname=clay
pkgver=0.14
pkgrel=1
pkgdesc="Header-only high performance UI layout library in C"
arch=('any')
url="https://github.com/nicbarker/${pkgname}"
license=('Zlib')
depends=()
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ee8f6477020dd72afe8cf6f8d3ab6855980028289a2b677a1423d17aab983585')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 clay.h -t "$pkgdir/usr/include"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
