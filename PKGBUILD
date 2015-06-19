# Maintainer: Daniel Lima <mail@tinyprog.tk>

pkgname=ttf-sazanami-hanazono
pkgver=20110504
pkgrel=1
pkgdesc='Full CJK and Latin-1 TTF font combining Sazanami-Mincho and Hanazono glyphs'
arch=('any')
url='http://www.javadikt.net/sazanami-hanazono/'
license=('BSD3')
provides='ttf-sazanami-hanazono'
makedepends=('unzip')
source=(http://forja.rediris.es/frs/download.php/2336/Sazanami-Hanazono.zip)
sha256sums=('SKIP')

package() {
	cd Sazanami-Hanazono
	install -Dm644 Sazanami-Hanazono-Mincho.ttf \
		$pkgdir/usr/share/fonts/TTF/Sazanami-Hanazono-Mincho.ttf
	install -Dm644 COPYING \
		$pkgdir/usr/share/licenses/$pkgname/COPYING
}

