# Maintainer: Bernardas Ališauskas bernardas.ališauskas@protonmail.com
pkgname=musicforprogramming
pkgver=1.0
pkgrel=1
pkgdesc="cli application for downloading music from musicforprogramming.net"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/musicforprogramming-dl"
depends=('python' 'python-setuptools' 'python-requests' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/Granitosaurus/musicforprogramming-dl/archive/v${pkgver}.tar.gz")
md5sums=('61306571c7f9d4bda1b1d86b75dff189')
package() {
  cd "${srcdir}/musicforprogramming-dl-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
