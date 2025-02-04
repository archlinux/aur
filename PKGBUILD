# Maintainer: robertfoster

pkgname=af9005-firmware
pkgver=6.11.23.01
pkgrel=5
pkgdesc="Firmware for Afatech af9005 based USB dvb devices"
arch=(any)
url="http://linuxtv.org/wiki/index.php/Afatech_AF9005"
license=("Custom")
source=("https://github.com/OpenELEC/dvb-firmware/raw/refs/heads/master/firmware/af9005.fw")
sha256sums=('5d1eedb40067a622c3ac6ec782f8c2de3af8d11e76603deed738deac7144cd82')

package() {
  mkdir -p ${pkgdir}/usr/lib/firmware
  install -m644 af9005.fw ${pkgdir}/usr/lib/firmware/af9005.fw
}
