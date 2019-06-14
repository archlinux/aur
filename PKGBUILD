# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034
pkgname=mn88472-firmware
pkgver=151102
pkgrel=1
pkgdesc="Firmware for Panasonic MN88472 DVB-T/T2/C demodulator"
arch=('any')
url="http://www.astrometa.com.tw/integrated_en.html"
license=('unknown')
source=("$pkgname-$pkgver::http://palosaari.fi/linux/v4l-dvb/firmware/MN88472/02/latest/dvb-demod-mn88472-02.fw")
md5sums=('088b891ac9273ff8c6818fca27b24d81')

package() {
	# shellcheck disable=SC2154
	install -Dm644 $pkgname-$pkgver "$pkgdir"/usr/lib/firmware/dvb-demod-mn88472-02.fw
}
