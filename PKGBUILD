# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-coveralls
_pypiname=coveralls-python
pkgver=2.1.2
pkgrel=1
pkgdesc="Provide Seemless integration with coveralls.io"
url="https://github.com/coveralls-clients/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-requests' 'python-docopt' "python>3.4")
makedepends=('python-setuptools' 'python2-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/coveralls-clients/coveralls-python/archive/${pkgver}.tar.gz)
sha256sums=('137325ebf3ebfe8bd8d297eab70fb29c451bb212c163551ec548e81fad925b25')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

