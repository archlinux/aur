# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-piplapis
_pkgname=piplapis-python
pkgver=5.2.2
pkgrel=1
pkgdesc="Python Library for interfacing with pipl.com"
url="https://pypi.org/project/piplapis-python/"
arch=('any')
license=('Apache2')
depends=('python-pytz')
makedepends=('python-six' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c511498cd30be09e721e287c8d59ea956f7b97febc3d290cb53574c7b16c5968')

package() {
  cd piplapis-python-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

