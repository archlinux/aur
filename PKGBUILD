pkgname=exprtk
pkgver=0.0.1
pkgrel=1
pkgdesc="C++ Mathematical Expression Library"
arch=('any')
url="http://www.partow.net/programming/exprtk/index.html"
license=('CPL')
depends=()
source=("https://github.com/ArashPartow/exprtk/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fb72791c88ae3b3426e14fdad630027715682584daf56b973569718c56e33f28')

package() {
  cd "$srcdir/exprtk-${pkgver}"
  install -d "${pkgdir}"/usr/include
  install -D -m644 exprtk.hpp "${pkgdir}"/usr/include
}
