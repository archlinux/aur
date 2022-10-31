#Contributor: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python-griddataformats
pkgver=1.0.1
pkgrel=1
pkgdesc="The gridDataFormats package provides classes to unify reading and writing n-dimensional datasets. One can read grid data from files, make them available as a Grid object, and allows one to write out the data again."
url="https://github.com/orbeckst/GridDataFormats/"
license=("GPL")
arch=('x86_64')
depends=('python-numpy')


source=(https://github.com/orbeckst/GridDataFormats/archive/$pkgver.tar.gz)
sha256sums=('10931ba3ac92d09da4f7155986bb7ae7de59ae225340cb03b84423b24f46e6eb')

build() {
  cd $srcdir/GridDataFormats-$pkgver
  python setup.py build
}

package(){
  cd $srcdir/GridDataFormats-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
