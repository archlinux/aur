# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-coveralls
_pypiname=coveralls-python
pkgver=3.1.0
pkgrel=1
pkgdesc="Provide Seemless integration with coveralls.io"
url="https://github.com/coveralls-clients/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-requests' 'python-docopt' "python>3.4")
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/coveralls-clients/coveralls-python/archive/${pkgver}.tar.gz)
sha256sums=('0c1dfb78f978ed038a4340baa9e5b39579d59019ccf0cd0fbf91ef727d2cac7d')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

