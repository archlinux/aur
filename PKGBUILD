# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=pyznap
pkgver=1.4.3
pkgrel=1
pkgdesc="ZFS snapshot tool written in Python"
url="https://github.com/yboetz/pyznap"
depends=('python')
makedepends=('python-setuptools' )
license=('GPLv3')
arch=('any')
source=("pyznap-${pkgver}.tar.gz::https://github.com/yboetz/pyznap/archive/v${pkgver}.tar.gz")
sha256sums=('bbc25bfddab34961a8042f6b695b65451dcd7d16171b62acf6383cb27be25c2c')

package() {
  cd $srcdir/pyznap-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
