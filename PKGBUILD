# Maintainer: renek <aur@spaceshore.net>
_pkgname=orderedset
pkgname=python-${_pkgname}
pkgver=2.0
pkgrel=1
pkgdesc="An ordered set implementation in cython"
arch=('any')
url='https://pypi.python.org/pypi/orderedset/'
license=('BSD')
depends=('python')
makedepends=('cython' 'python-setuptools')
source=("https://pypi.python.org/packages/source/o/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ab9d6763025d7ab8f2eb644ab5093b1360b9f4a29fa032e69c3343c7802055ef381f1206ad9499be32a0e4c7824c2f03921eeda05897dd32f536e369bea5df46')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
