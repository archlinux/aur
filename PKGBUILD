# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-memoized-property'
pkgver=1.0.3
pkgrel=2
pkgdesc="Python decorator for defining properties that only run their fget function once"
arch=('any')
url="https://pypi.python.org/pypi/memoized-property"
license=('BSD')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
ptions=(!emptydirs)
source=("https://pypi.python.org/packages/70/db/23f8b5d86c9385299586c2469b58087f658f58eaeb414be0fd64cfd054e1/memoized-property-${pkgver}.tar.gz")
md5sums=('ae9bf3ef40b9a08a4f1798fb322c6865')

package() {
  cd "${srcdir}/memoized-property-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
