# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>
# Contributor: josephgbr

pkgname=racer
pkgver=1.1.64
pkgrel=3
pkgdesc="2D car racing game"
arch=('i686' 'x86_64')
url="http://hippo.nipax.cz/download.cz.php?id=64"
license=("GPL2")
depends=('allegro4' 'libjpeg')
source=("http://hippo.nipax.cz/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('063e87c43071e6dcb112807abc422bd7')
install=racer.install

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}"/usr install
}
