# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-aquiline-two
pkgver=1.0
pkgrel=1
pkgdesc='Calligraphic display font by Manfred Klein'
arch=(any)
url='https://www.fontsquirrel.com/fonts/aquiline-two'
license=(custom)
source=("$pkgname-$pkgver.zip::https://www.fontsquirrel.com/fonts/download/Aquiline-two")
sha256sums=('795f181afe407fa6012d24e674359797a31ffc0325425486cbb33be3cb7ad905')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" 'Manfred Klein License.txt'
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" AquilineTwo.ttf
}
