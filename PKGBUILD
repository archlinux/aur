# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase=python-coveralls
pkgname=('python-coveralls' 'python2-coveralls')
_pypiname=coveralls-python
pkgver=1.11.1
pkgrel=1
pkgdesc="Provide Seemless integration with coveralls.io"
url="https://github.com/coveralls-clients/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-requests' 'python-docopt')
makedepends=('python-setuptools' 'python2-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/coveralls-clients/coveralls-python/archive/${pkgver}.tar.gz)
sha256sums=('5e0bb2b79f79327e07c4e83cdf25e32157fd9323527a8c12f7c88beb793a8dc6')

package_python-coveralls() {
  depends=('python-coverage' 'python-requests' 'python-docopt')
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

package_python2-coveralls() {
  depends=('python2-coverage' 'python2-requests' 'python2-docopt')
  cd ${_pypiname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}


