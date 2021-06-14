# Contributor: maddien <madstitz@googlemail.com>
# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=a850-fw
pkgver=5.24.0.0
pkgrel=2
pkgdesc="Firmware for AVerMedia AverTV Volar Black HD DVB-T USB 2.0 (A850)"
arch=(any)
url="https://linuxtv.org"
license=('GPL')
source=("https://palosaari.fi/linux/v4l-dvb/firmware/af9015/${pkgver}/dvb-usb-af9015.fw")
md5sums=('4ea04354bb30fba400c7c84abf99ac13')
noextract=(dvb-usb-af9015.fw)

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/lib/firmware
  cp dvb-usb-af9015.fw $pkgdir/usr/lib/firmware
}
