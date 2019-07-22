# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=pyznap
pkgver=1.2.1
pkgrel=1
pkgdesc="ZFS snapshot tool written in Python"
url="https://github.com/yboetz/pyznap"
depends=('python')
makedepends=('python-setuptools' )
license=('GPLv3')
arch=('any')
source=("pyznap-${pkgver}.tar.gz::https://github.com/yboetz/pyznap/archive/v${pkgver}.tar.gz")
sha256sums=('230efa4430bf68e080b6978e6d2c223f1c6e5401e333da2ddad0e92ccc3c2c56')

package() {
  cd $srcdir/pyznap-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
