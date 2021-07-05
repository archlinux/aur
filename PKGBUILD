# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=kulic
pkgver=1.1.64
pkgrel=1
pkgdesc="2d shooting game"
url='http://hippo.nipax.cz/download.cz.php?id=59'
arch=('x86_64')
license=('GPL-2')
depends=('allegro4' 'libjpeg')
source=("http://hippo.nipax.cz/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('c5a8271b4273afd4170df0ded82994e2')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/usr" install
}
