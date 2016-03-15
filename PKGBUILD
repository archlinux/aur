# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=dvb-usb-ds3103-fw
pkgver=1.0
pkgrel=1
pkgdesc="Firmware for TechnoTrend TT-connect S2-4600"
arch=( 'any')
url="https://www.linuxtv.org/wiki/index.php/TechnoTrend_TT-connect_S2-4600"
license=('unknown')
source=("http://palosaari.fi/linux/v4l-dvb/firmware/M88DS3103/3.B/dvb-demod-m88ds3103.fw")

package() {
	mkdir -p $pkgdir/usr/lib/firmware
	cp dvb-demod-m88ds3103.fw $pkgdir/usr/lib/firmware
}
md5sums=('b31080dd205ce1659ed7aedf2b153e03')
