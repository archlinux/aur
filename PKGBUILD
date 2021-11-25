# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-aquiline-two
pkgver=1.0
pkgrel=2
pkgdesc='Calligraphic display font by Manfred Klein'
arch=(any)
url='https://www.fontsquirrel.com/fonts/aquiline-two'
license=(custom)
source=("$pkgname-$pkgver.zip::https://www.fontsquirrel.com/fonts/download/Aquiline-two")
sha256sums=('SKIP')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" 'Manfred Klein License.txt'
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" AquilineTwo.ttf
}
