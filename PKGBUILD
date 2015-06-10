# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-pathtools
pkgver=0.1.2
pkgrel=1
pkgdesc="Pattern matching and various utilities for file systems paths"
arch=('any')
url="https://pypi.python.org/pypi/pathtools/"
license=('MIT')
depends=('python2')
source=(https://pypi.python.org/packages/source/p/pathtools/pathtools-$pkgver.tar.gz)

build() {
  cd "$srcdir/pathtools-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pathtools-$pkgver"
  python2 setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
md5sums=('9a1af5c605768ea5804b03b734ff0f82')
