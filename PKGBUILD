# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aadict
_pkgname=aadict
pkgver=0.2.3
pkgrel=1
_file=
pkgdesc="An auto-attribute dict (and a couple of other useful dict functions), for Python"
url="https://pypi.org/project/aadict/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a77328ac55dbb5735da99441870251befe135f687ab707a7a178561363b27704')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
