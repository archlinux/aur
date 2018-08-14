#Contributor: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python2-griddataformats
pkgver=0.4.0
pkgrel=1
pkgdesc="The gridDataFormats package provides classes to unify reading and writing n-dimensional datasets. One can read grid data from files, make them available as a Grid object, and allows one to write out the data again."
url="https://github.com/orbeckst/GridDataFormats/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('python2-numpy')


source=(https://github.com/orbeckst/GridDataFormats/archive/$pkgver.tar.gz)
sha1sums=('dc4ffec05ade25a691b5529ff9d580755130bcc7')

build() {
  cd $srcdir/GridDataFormats-$pkgver
  python2 setup.py build
}

package(){
  cd $srcdir/GridDataFormats-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
