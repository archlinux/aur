pkgname=exprtk
pkgver=0.0.2
pkgrel=1
pkgdesc="C++ Mathematical Expression Library"
arch=('any')
url="http://www.partow.net/programming/exprtk/index.html"
license=('CPL')
depends=()
source=("https://github.com/ArashPartow/exprtk/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7e8de4a0bfc9855c1316d8b8bc422061aef9a307c2f42d2e66298980463195c1')

package() {
  cd "$srcdir/exprtk-${pkgver}"
  install -d "${pkgdir}"/usr/include
  install -D -m644 exprtk.hpp "${pkgdir}"/usr/include
}
