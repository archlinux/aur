# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-coveralls
_pypiname=coveralls-python
pkgver=3.2.0
pkgrel=1
pkgdesc="Provide Seemless integration with coveralls.io"
url="https://github.com/coveralls-clients/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-requests' 'python-docopt' "python>3.4")
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/coveralls-clients/coveralls-python/archive/${pkgver}.tar.gz)
sha256sums=('fff8fd52fc2d374a5f8be267ca44df7993ca721a8d50ed62f6e8c05eded4112e')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

