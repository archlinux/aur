# Maintainer: Delvier <delvier4 at outlook dot com>

pkgname=ttf-jigmo
pkgver=20230816
pkgrel=1
pkgdesc='Japanese Kanji font set which is the official successor to Hanazono Mincho'
arch=('any')
url='https://kamichikoichi.github.io/jigmo/'
license=('CC0')
makedepends=('unzip')
source=(https://kamichikoichi.github.io/jigmo/Jigmo-20230816.zip)
sha256sums=('4d2641686e0978819a3fc0f5250b31a209f829de42bb12448745fc8d89dd2fc2')

package() {
	cd Jigmo-$pkgver
	install -Dm644 Jigmo.ttf \
		$pkgdir/usr/share/fonts/TTF/Jigmo.ttf
	install -Dm644 Jigmo2.ttf \
		$pkgdir/usr/share/fonts/TTF/Jigmo2.ttf
	install -Dm644 Jigmo3.ttf \
		$pkgdir/usr/share/fonts/TTF/Jigmo3.ttf
	install -Dm644 LICENSE.txt \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE
}
