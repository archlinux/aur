# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=otf-stilu
pkgver=1.0
pkgrel=3
pkgdesc='Sans-serif font in 8 cuts'
arch=(any)
url="https://www.fontsquirrel.com/fonts/stilu"
license=(OFL)
source=("$pkgname-$pkgver.zip::https://www.fontsquirrel.com/fonts/download/stilu")
sha256sums=('SKIP')

package() {
	install -Dm644 'SIL Open Font License.txt' \
		"$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
	install -Dm644 -t "$pkgdir/usr/share/fonts/stilu" *.otf
}
