#Contributor: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python2-griddataformats
pkgver=0.3.2
pkgrel=1
pkgdesc="The gridDataFormats package provides classes to unify reading and writing n-dimensional datasets. One can read grid data from files, make them available as a Grid object, and allows one to write out the data again."
url="https://github.com/orbeckst/GridDataFormats/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('python2-numpy')


source=(https://github.com/orbeckst/GridDataFormats/archive/release-$pkgver.tar.gz)
sha1sums=('4a8f035a618a3de4a2c20b7f56d048f291dcfdb1')

build() {
  cd $srcdir/GridDataFormats-release-$pkgver
  python2 setup.py build
}

package(){
  cd $srcdir/GridDataFormats-release-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
