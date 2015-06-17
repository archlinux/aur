# Maintainer: M0Rf30

pkgname=af9005-firmware
pkgver=6.11.23.01
pkgrel=3
pkgdesc="Firmware for Afatech af9005 based USB dvb devices"
arch=(any)
url="http://linuxtv.org/wiki/index.php/Afatech_AF9005"
license=("Custom")
source=(http://ventoso.org/luca/af9005/af9005.fw-$pkgver)
md5sums=('5e558928cf552eb6b247384f611f548c')
provides=(linux-firmware)

package() {
   mkdir -p ${pkgdir}/usr/lib/firmware
   install -m644 af9005.fw-$pkgver ${pkgdir}/usr/lib/firmware/af9005.fw
}

 
