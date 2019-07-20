# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aadict
_pypiname=aadict
pkgver=0.2.3
pkgrel=1
pkgdesc="An auto-attribute dict (and a couple of other useful dict functions), for Python"
url="https://pypi.org/project/aadict/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/50/30/2d6c516ff308e1a2e25b8cf4274bd0ed763861b3d2b5cd1fb54c6d59bfcb/aadict-${pkgver}.tar.gz")
sha256sums=('a77328ac55dbb5735da99441870251befe135f687ab707a7a178561363b27704')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
