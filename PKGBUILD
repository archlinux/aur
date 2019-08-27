# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=pyznap
pkgver=1.4.1
pkgrel=1
pkgdesc="ZFS snapshot tool written in Python"
url="https://github.com/yboetz/pyznap"
depends=('python')
makedepends=('python-setuptools' )
license=('GPLv3')
arch=('any')
source=("pyznap-${pkgver}.tar.gz::https://github.com/yboetz/pyznap/archive/v${pkgver}.tar.gz")
sha256sums=('c32e2a88f1cc318bc8e07bea6bde860a067db50f55459281ed6abf351f692cc5')

package() {
  cd $srcdir/pyznap-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
