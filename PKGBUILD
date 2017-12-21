# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-memoized-property'
pkgver=1.0.1
pkgrel=1
pkgdesc="Python decorator for defining properties that only run their fget function once"
arch=('any')
url="https://pypi.python.org/pypi/memoized-property"
license=('BSD')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
ptions=(!emptydirs)
source=("https://pypi.python.org/packages/42/8d/81892a7858ce247a2e305cf7ff35db13f260fe232d98dd7fe85971b263d1/memoized-property-${pkgver}.tar.gz")
md5sums=('8b05cbd912d3d4c24c2d62c3ab0f5b7f')

package() {
  cd "${srcdir}/memoized-property-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
