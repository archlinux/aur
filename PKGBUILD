#Maintainer: The_Loko
# Maintainer: nakki87

pkgname=af9015-firmware
pkgver=5.24.0.0
pkgrel=5
pkgdesc="Firmware for Afatech af9015 based USB dvb devices"
arch=('any')
url="http://linuxtv.org/wiki/index.php/Afatech_AF9015"
license=('unknown')
source=(http://palosaari.fi/linux/v4l-dvb/firmware/af9015/5.24.0.0/dvb-usb-af9015.fw)
md5sums=('4ea04354bb30fba400c7c84abf99ac13')

package() {
   mkdir -p ${pkgdir}/usr/lib/firmware
   install -m644 dvb-usb-af9015.fw ${pkgdir}/usr/lib/firmware
}

