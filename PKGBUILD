# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-typechecks'
pkgver=0.0.2
pkgrel=1
pkgdesc="Helper functions for runtime type checking"
arch=('any')
url="https://pypi.python.org/pypi/typechecks"
license=('Apache-2.0')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
ptions=(!emptydirs)
source=("https://pypi.python.org/packages/60/8e/ca9aac318aeb8e909b4435881c79a633ed40e4efa6fbb3c32c393b5da512/typechecks-${pkgver}.tar.gz")
md5sums=('07501491d2f9e7a67889df15be1b1ea8')

package() {
  cd "${srcdir}/typechecks-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
