# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase=python-coveralls
pkgname=('python-coveralls' 'python2-coveralls')
_pypiname=coveralls-python
pkgver=1.5.1
pkgrel=1
pkgdesc="Provide Seemless integration with coveralls.io"
url="https://github.com/coveralls-clients/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-requests' 'python-docopt')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/coveralls-clients/coveralls-python/archive/${pkgver}.tar.gz)
sha256sums=('006254a9a37c9727cc191c4ddeb21b6af9812499e623fae49c8c2c7c15855e5b')

package_python-coveralls() {
  depends=('python-coverage' 'python-requests' 'python-docopt')
  makedepends=('python-setuptools')
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

package_python2-coveralls() {
  depends=('python2-coverage' 'python2-requests' 'python2-docopt')
  makedepends=('python2-setuptools')
  cd ${_pypiname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}


