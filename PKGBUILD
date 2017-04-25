# Maintainer: Daniel Lima <danielm@nanohub.tk>

pkgname=ttf-sazanami-hanazono
pkgver=20110504
pkgrel=1
pkgdesc='Full CJK and Latin-1 TTF font combining Sazanami-Mincho and Hanazono glyphs'
arch=('any')
url='http://www.javadikt.net/sazanami-hanazono/'
license=('BSD3')
makedepends=('unzip')
source=(https://bitbucket.org/limadm/ttf-sazanami-hanazono/downloads/Sazanami-Hanazono.zip)
md5sums=('326889dde3432d1e7175e821c866e4af')

package() {
	cd Sazanami-Hanazono
	install -Dm644 Sazanami-Hanazono-Mincho.ttf \
		$pkgdir/usr/share/fonts/TTF/Sazanami-Hanazono-Mincho.ttf
	install -Dm644 COPYING \
		$pkgdir/usr/share/licenses/$pkgname/COPYING
}

