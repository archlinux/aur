# Maintainer: Alexander Nicholi <me ~at~ nicholatian ~dot~ com>

_name='csv23'
pkgname="python2-${_name}"
pkgver=0.3.4
pkgrel=1
pkgdesc='Python 2/3 unicode CSV compatibility layer'
url="http://github.com/xflr6/${_name}/"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("https://github.com/xflr6/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f49a87213c1531bbaa20dbe9dd6b5869cee3bb5109d51c05d0ebd5c49fd39492')

package() {
  cd "${srcdir}/${_name}-${pkgver}" || exit
  python2 setup.py install --root="${pkgdir}" -O1
}
