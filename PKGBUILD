# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-coveralls
_pypiname=coveralls-python
pkgver=2.0.0
pkgrel=1
pkgdesc="Provide Seemless integration with coveralls.io"
url="https://github.com/coveralls-clients/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-requests' 'python-docopt' "python>3.4")
makedepends=('python-setuptools' 'python2-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/coveralls-clients/coveralls-python/archive/${pkgver}.tar.gz)
sha256sums=('3340e33b64a032a01d489bf32bbcc8c7616d4c22d3c6ce0d6ebb7f4463c9ebd3')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

