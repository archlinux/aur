# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=usbdump
pkgver=1.0
pkgrel=1
pkgdesc="simple usbmon frontend"
url="http://biot.com/usbdump/"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://biot.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ad491d7f19ada71e8c04f03eb6aa949601b49025276d5a15cfe8a96b9102f050')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make usbdump
}

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/usbdump ${pkgdir}/usr/bin/usbdump
}
