# Maintainer: Spike29 <leguen.yannick@gmail.com>

pkgname='dvb-usb-wt220u-miglia-fw'
pkgver='1'
pkgrel=2
pkgdesc="Firmware dvb-usb-wt220u-miglia-01.fw for Miglia TVMini USB DVB-T stick"
arch=('any')
license=('GPL3')
url="http://www.linuxtv.org/wiki/index.php/DVB-T_USB_Devices"
source=('http://www.duff.dk/dvb-usb-wt220u-miglia-01.fw')
md5sums=('95131f887f9641f2ebe6a1b5e23e27af')


package() {
	mkdir -p "$pkgdir/usr/lib/firmware/"
	install -m0644 "$srcdir/dvb-usb-wt220u-miglia-01.fw" \
	"$pkgdir/usr/lib/firmware/"
}