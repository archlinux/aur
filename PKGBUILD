# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=pyznap
pkgver=1.6.0
pkgrel=2
pkgdesc="ZFS snapshot tool written in Python"
url="https://github.com/yboetz/pyznap"
depends=('python')
makedepends=('python-setuptools')
license=('GPLv3')
arch=('any')
source=("pyznap-${pkgver}.tar.gz::https://github.com/yboetz/pyznap/archive/v${pkgver}.tar.gz")
sha256sums=('0668308132fecc7e37626490f683ebfaf2ffb89a462162cd112951178150bb1f')

package() {
  cd $srcdir/pyznap-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
