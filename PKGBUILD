# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=pyznap
pkgver=1.5.0
pkgrel=1
pkgdesc="ZFS snapshot tool written in Python"
url="https://github.com/yboetz/pyznap"
depends=('python')
makedepends=('python-setuptools' )
license=('GPLv3')
arch=('any')
source=("pyznap-${pkgver}.tar.gz::https://github.com/yboetz/pyznap/archive/v${pkgver}.tar.gz")
sha256sums=('7c379dc8c36c8c68b9855b0a980cdea816a8bb508a40f2ebcf9f3455bd8023c5')

package() {
  cd $srcdir/pyznap-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
