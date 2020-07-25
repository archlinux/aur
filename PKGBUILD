# Maintainer:	Batuhan Baserdem <lastname dot firstname at gmail>

_name="hjson"
pkgname="python-${_name}"
pkgver=3.0.1
pkgrel=1
pkgdesc="JSON for Humans, allows comments and is less error prone."
arch=(any)
url="https://github.com/laktak/hjson-py"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/h/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('afac353feb47003c8ad31e5b7197ac6a')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
