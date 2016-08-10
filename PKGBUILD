# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=freebasic-gnomeheaders
pkgver=1.0
pkgrel=1
pkgdesc="Collection of GNOME headers for freeBASIC"
arch=(any)
url="https://www.freebasic-portal.de/downloads/bibliotheken/gtk-3-header-dateien-fuer-freebasic-191.html"
license=(LGPL)
depends=(freebasic)
source=("https://www.freebasic-portal.de/dlfiles/574/GnomeHeaders-$pkgver.7z")
sha256sums=('4f10cb5b771c06053a53dc7bab8931947ecb39db38d3a40562783fd034a97652')

package() {
	cd "GnomeHeaders-$pkgver"
	install -dm755 "$pkgdir/usr/include/freebasic"
	cp -r include/Gir "$pkgdir/usr/include/freebasic"
}
