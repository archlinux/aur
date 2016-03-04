pkgname=python2-binplist
pkgver=0.1.4
pkgrel=1
pkgdesc="Binary property list (plist) parser module written in python"
arch=('any')
epoch=1
url="https://code.google.com/p/binplist/"
license=('MIT')
depends=()
makedepends=('python2')
md5sums=('5c4788a9731b67487790109910380699')

source=(https://binplist.googlecode.com/files/binplist-${pkgver}.tar.gz)

build() {
  export PYTHON=python2
  cd $srcdir/binplist-${pkgver}
  python2 setup.py build
}
package() {
  cd $srcdir/binplist-${pkgver}
  python2 setup.py install --root=$pkgdir
}
