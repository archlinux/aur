# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Adrian Sampson <adrian@radbox.org>

pkgname=python-munkres
pkgver=1.0.8
pkgrel=1
pkgdesc='munkres algorithm for the assignment problem'
depends=('python')
makedepends=('setuptools')
arch=('any')
source=("https://pypi.python.org/packages/07/17/5debec658b151d39c7a29fcc830bbfb5cb22f18e7ff7d6537deab73943ab/munkres-$pkgver.tar.gz")
md5sums=('8e93108d2cb0e532aabd5dc9e418328c')
url='http://bmc.github.com/munkres/'
license=('BSD')

build() {
  cd "$srcdir/munkres-$pkgver"
  /usr/bin/python setup.py build
}

package() {
  cd "$srcdir/munkres-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir"
}
