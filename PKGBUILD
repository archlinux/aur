# Maintainer: Husam Bilal <husam212 AT gmail DOT com>

pkgname=python-orderedmultidict
pkgver=0.7.5
pkgrel=1
pkgdesc="Ordered multivalue dictionary that retains method parity with dict."
url="https://github.com/gruns/orderedmultidict"
depends=('python' 'python-six')
makedepends=('python3' )
license=('custom:UNLICENSE')
arch=('any')
source=('https://pypi.python.org/packages/source/o/orderedmultidict/orderedmultidict-0.7.5.tar.gz')
md5sums=('721b0454c088f4f72b22d10cb5f1a2d0')

build() {
  cd "$srcdir/python-orderedmultidict-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/python-orderedmultidict-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
