# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=rednose
pkgname=python2-rednose
pkgver=0.4.3
pkgrel=1
pkgdesc="coloured output for nosetests"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('MIT')
depends=('python2' 'python2-colorama' 'python2-termstyle')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('0f4d5ff44fc0f64cb5ed5b57f3605f64')

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py build
  }

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}
