# Maintainer: Guillaume Bouchard <guillaume.bouchard@liris.cnrs.fr>
pkgname=python2-squaremap
pkgver=1.0.4
pkgrel=1
pkgdesc="Hierarchic data-visualisation control for wxPython"
arch=('any')
url="https://launchpad.net/squaremap"
license=('GPL')
depends=('wxpython')
source=("https://pypi.python.org/packages/source/S/SquareMap/SquareMap-$pkgver.tar.gz")

build() {
  cd "$srcdir/SquareMap-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/SquareMap-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

md5sums=('e36a453baddb97c19af6f79d5ba51f38')
