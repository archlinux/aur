# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=colorclass
pkgname=python2-colorclass
pkgver=2.2.0
pkgrel=1
pkgdesc="Colorful worry-free console applications for Linux, Mac OS X, and Windows"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('060139e93e31faafeb5d4bdfd6ea0bb8')

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}
