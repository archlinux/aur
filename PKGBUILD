# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-coveralls
_pypiname=coveralls-python
pkgver=2.2.0
pkgrel=1
pkgdesc="Provide Seemless integration with coveralls.io"
url="https://github.com/coveralls-clients/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-requests' 'python-docopt' "python>3.4")
makedepends=('python-setuptools' 'python2-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/coveralls-clients/coveralls-python/archive/${pkgver}.tar.gz)
sha256sums=('98768c6118c96c543f278474001b92d6987a04edab3b6b763498b7d6cf77dc47')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

