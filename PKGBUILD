# Maintainer: Daniel Lima <mail@tinyprog.tk>

pkgname=ttf-sazanami-hanazono
pkgver=20110504
pkgrel=1
pkgdesc='Full CJK and Latin-1 TTF font combining Sazanami-Mincho and Hanazono glyphs'
arch=('any')
url='http://www.javadikt.net/sazanami-hanazono/'
license=('BSD3')
makedepends=('unzip')
source=(https://bitbucket.org/limadm/ttf-sazanami-hanazono/downloads/Sazanami-Hanazono.zip)
sha256sums=('596b8912778317319e871ceb8985b3644dc5b46e6eb7ce317ff2b2bf02bccef5')

package() {
	cd Sazanami-Hanazono
	install -Dm644 Sazanami-Hanazono-Mincho.ttf \
		$pkgdir/usr/share/fonts/TTF/Sazanami-Hanazono-Mincho.ttf
	install -Dm644 COPYING \
		$pkgdir/usr/share/licenses/$pkgname/COPYING
}

