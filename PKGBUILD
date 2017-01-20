# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=zxcvbn
pkgname=python2-zxcvbn
pkgver=1.0
pkgrel=1
pkgdesc="Password strength estimator"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=(
    'python2'
    )
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('4b875b9f954a7aef2269eb8c1177b591')

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}
