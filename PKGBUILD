# Maintainer: James An <james@jamesan.ca>

pkgname=python-hghooks
_pkgname=hghooks
pkgver=0.6.0
pkgrel=1
pkgdesc='TODO'
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}/${pkgver}"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('0e903dc90e06b290f1553f84d56c9f58')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1
}
