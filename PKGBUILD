#Contributor: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python-griddataformats
pkgver=1.0.2
pkgrel=1
pkgdesc="The gridDataFormats package provides classes to unify reading and writing n-dimensional datasets. One can read grid data from files, make them available as a Grid object, and allows one to write out the data again."
url="https://github.com/orbeckst/GridDataFormats/"
license=("GPL")
arch=('x86_64')
depends=('python-numpy')


source=(https://github.com/orbeckst/GridDataFormats/archive/$pkgver.tar.gz)
sha256sums=('19522bc2de4af0bc4dd7d44716951852cd7ff6a98f59de3551301fcea70ff57c')

build() {
  cd $srcdir/GridDataFormats-$pkgver
  python setup.py build
}

package(){
  cd $srcdir/GridDataFormats-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
