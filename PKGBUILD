# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=pyshapelib
pkgver=0.3
pkgrel=2
pkgdesc="Python library for reading and writing ESRI Shapefiles"
arch=('i686' 'x86_64')
url="http://ftp.intevation.de/users/bh/pyshapelib"
license=('LGPL')
depends=('python2')
makedepends=('python2-distribute')
source=(http://ftp.intevation.de/users/bh/pyshapelib/${pkgname}-${pkgver}.zip http://dl.maptools.org/dl/shapelib/shapelib-1.2.10.tar.gz)
md5sums=('970232a523aba1a4d20377fee5b86a46' '4d96bd926167193d27bf14d56e2d484e')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   ln -sf "$srcdir/shapelib-1.2.10" "$srcdir/shapelib"
   python2 setup.py install --prefix=/usr --root="$pkgdir"
}

