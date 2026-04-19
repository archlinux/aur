pkgname=exprtk
pkgver=0.0.3
pkgrel=1
pkgdesc="C++ Mathematical Expression Library"
arch=('any')
url="http://www.partow.net/programming/exprtk/index.html"
license=('CPL')
depends=()
source=("https://github.com/ArashPartow/exprtk/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f9dec6975e86c702033d6a65ba9a0368eba31a61b89d74f2b5d24457c02c8439')

package() {
  cd "$srcdir/exprtk-${pkgver}"
  install -d "${pkgdir}"/usr/include
  install -D -m644 exprtk.hpp "${pkgdir}"/usr/include
}
