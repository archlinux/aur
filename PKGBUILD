# Maintainer: kirigar <me@kirigar.com>
pkgname=ttf-microns
pkgver=1.0.6
pkgrel=1
pkgdesc="The universal icon set for user interfaces."
arch=(any)
url="https://www.s-ings.com/projects/microns-icon-font/"
license=('OFL')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/stephenhutchings/microns/tar.gz/v$pkgver")
md5sums=('0c380a7d87275de67a4631688f596575')

package() {
	cd microns-$pkgver
	install -Dm644 -t "$pkgdir/usr/share/fonts/microns/" "fonts/microns.ttf"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENCE.md"
}
