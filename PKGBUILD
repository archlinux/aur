# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
_pkgname=glacial-indifference
pkgname=otf-$_pkgname
pkgver=1.0
pkgrel=3
pkgdesc='Geometric sans-serif font in 3 cuts'
arch=(any)
url="https://cargocollective.com/hanken/Glacial-Indifference-Open-Source-Font"
license=(OFL)
source=("$pkgname-$pkgver.zip::https://www.fontsquirrel.com/fonts/download/$_pkgname")
sha256sums=('2d5f36fedcb6dffa6ed78cbe75a7ac54a2930905ed26f4f12fe7380728776e71')

package() {
	install -Dm644 'SIL Open Font License.txt' \
		"$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
	install -Dm644 -t "$pkgdir/usr/share/fonts/$_pkgname" *.otf
}
