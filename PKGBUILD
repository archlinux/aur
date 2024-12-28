# Maintainer: uwiwiow <uwiwiow@gmail.com>

pkgname=clay
pkgver=0.12
pkgrel=1
pkgdesc="Header-only high performance UI layout library in C"
arch=('any')
url="https://github.com/nicbarker/${pkgname}"
license=('Zlib')
depends=()
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b36f19352635edeb6d770fe77fab267982d9f206beb541849578de9f0aaff825')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 clay.h -t "$pkgdir/usr/include"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
