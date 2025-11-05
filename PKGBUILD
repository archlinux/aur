# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=labwc-theme-adwaita
pkgdesc='GNOME/Adwaita theme for the labwc compositor'
pkgver=1.7
pkgrel=1
url='https://github.com/davidphilipbarr/labwc-adwaita'
arch=(any)
license=(MIT)
depends=(labwc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('d23f21d808e8a65be178263b25feeebfb4166ae7f3001a152b97a5e2c1d084d19a55ca104685e678a39865930fb874137cba727ba9e004516bf0d07d93af2880')

build () {
	msg2 'Nothing to build'
}

package () {
	install -m755 -d "$pkgdir/usr/share/themes"
	cp -r "labwc-adwaita-$pkgver/themes"/Adwaita{,-dark} "$pkgdir/usr/share/themes/"
}
