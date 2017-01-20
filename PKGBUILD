# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=zxcvbn-python
pkgname=python2-zxcvbn
pkgver=4.4.12
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
md5sums=('ca8e19e3ff37c16e88bd0f70e3fabdad')

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}
