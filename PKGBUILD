# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=otf-stilu
pkgver=1.0
pkgrel=2
pkgdesc='Sans-serif font in 8 cuts'
arch=(any)
url="https://www.fontsquirrel.com/fonts/stilu"
license=(OFL)
source=("$pkgname-$pkgver.zip::https://www.fontsquirrel.com/fonts/download/stilu")
sha256sums=('9c7365824cc1311f5e9a5c0218207cd23d82c7abc4d9ac61864bfdc00cd7a5d2')

package() {
	install -Dm644 'SIL Open Font License.txt' \
		"$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
	install -Dm644 -t "$pkgdir/usr/share/fonts/stilu" *.otf
}
