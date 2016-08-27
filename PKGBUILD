# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=btsco
pkgver=0.5
pkgrel=4
pkgdesc="Bluez Bluetooth SCO Tool"
arch=(i686 x86_64)
license=("GPL")
url="http://bluetooth-alsa.sourceforge.net"
depends=('alsa-lib' 'xmms' 'bluez-libs')
makedepends=('automake' 'autoconf')
source=(http://downloads.sourceforge.net/sourceforge/bluetooth-alsa/${pkgname}-${pkgver}.tgz)
md5sums=('d9fdd63a9e22ba839a41c8a9b89c2dda')
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=${startdir}/pkg/${pkgname}/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install
}
