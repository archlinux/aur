# Maintainer:  <clu>

pkgname=python2-coords  
pkgver=0.39.5
pkgrel=1
pkgdesc="for managing astronomical coordinate systems"
url="https://trac6.assembla.com/astrolib"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2')
makedepends=('python2')
conflicts=()
replaces=()
backup=()
#source=(http://stsdas.stsci.edu/astrolib/coords-0.37.tar.gz)
source=(https://pypi.python.org/packages/source/a/astrolib.coords/astrolib.coords-${pkgver}.tar.gz)
sha1sums=('b92d553b2d57fd20a8966e00f8f7fdc4e725d83e')

build() {
  cd $srcdir/astrolib.coords-${pkgver}
  python2 setup.py build
}

package() {
  cd $srcdir/astrolib.coords-${pkgver}
  python2 setup.py install --root=$pkgdir/ --prefix=/usr --optimize=1
}
