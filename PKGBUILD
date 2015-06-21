# Maintainer:  <clu>

pkgname=python2-pyds9  
pkgver=1.7
pkgrel=1
pkgdesc="A Python Connection to DS9 via XPA"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2')
makedepends=('python2' 'python2-distribute')
optdepends=('ds9-bin: astronomical data visualization application')
conflicts=()
replaces=()
backup=()
source=(http://hea-www.harvard.edu/RD/download/pyds9/pyds9-$pkgver.tar.gz)
sha1sums=('454cef329375f13a14eb0059565c0dc91dd1713d')

build() {
  cd $srcdir/pyds9-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/pyds9-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1 
}
