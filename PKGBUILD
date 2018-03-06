# Maintainer: Score_Under <seejay.11@gmail.com>
pkgname=python2-flvlib
_pypkgname=flvlib
pkgver=0.1.13
pkgrel=1
pkgdesc="A library for manipulating, parsing and verifying FLV files."
url="https://pypi.python.org/pypi/flvlib"
arch=(any)
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/f/$_pypkgname/$_pypkgname-$pkgver.tar.bz2")
md5sums=('b0da79254d69ab38796167a2f55a1dd5')

build() {
  cd "$srcdir/$_pypkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pypkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
