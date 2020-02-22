# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
_pkgname=glacial-indifference
pkgname=otf-$_pkgname
pkgver=1.0
pkgrel=1
pkgdesc='Geometric sans-serif font in 3 cuts'
arch=(any)
url="https://cargocollective.com/hanken/Glacial-Indifference-Open-Source-Font"
license=(OFL)
depends=(fontconfig xorg-font-utils)
source=("$pkgname-$pkgver.zip::https://www.fontsquirrel.com/fonts/download/$_pkgname")
sha256sums=('bdc8ec56da57a2324cd67bd942727eee048c106cfcbf9427b47e59366fbeeac4')

package() {
	install -Dm644 'SIL Open Font License.txt' \
		"$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
	install -Dm644 -t "$pkgdir/usr/share/fonts/$_pkgname" *.otf
}
