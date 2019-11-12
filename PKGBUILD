# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase=python-coveralls
pkgname=('python-coveralls' 'python2-coveralls')
_pypiname=coveralls-python
pkgver=1.8.2
pkgrel=1
pkgdesc="Provide Seemless integration with coveralls.io"
url="https://github.com/coveralls-clients/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-requests' 'python-docopt')
makedepends=('python-setuptools' 'python2-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/coveralls-clients/coveralls-python/archive/${pkgver}.tar.gz)
sha256sums=('28cef1a96984bbabdae84f2cc6a54077ba5841c2fc5b54abf8ef171587e476b2')

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


