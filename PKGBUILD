# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgbase=python-coveralls
pkgname=('python-coveralls' 'python2-coveralls')
_pypiname=coveralls-python
pkgver=1.5.0
pkgrel=1
pkgdesc="Provide Seemless integration with coveralls.io"
url="https://github.com/coveralls-clients/coveralls-python"
arch=('any')
license=('MIT')
depends=('python-coverage' 'python-requests' 'python-docopt')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::https://github.com/coveralls-clients/coveralls-python/archive/${pkgver}.tar.gz)
sha256sums=('1aca2a1d16b7b182e752b73a00934339f0c76d4fcdc103f59fe9b62956b93a98')

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


