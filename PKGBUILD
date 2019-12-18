# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-fira-go
pkgver=1.001
_pkgver=1001
pkgrel=2
_commit=715cd3e8b59179822cd5b86933ecfc254cd1e74e  # master
pkgdesc="FiraGO font family"
arch=('any')
url="https://bboxtype.com/typefaces/FiraGO/"
license=('custom:OFL')
source=("https://github.com/bBoxType/FiraGO/archive/$_commit.zip")
sha256sums=('44d2acf57da774dc067b464399ecc1298b0dffc16d74c827e0a8df40aaff360a')

package() {
	cd FiraGO-$_commit/Fonts/FiraGO_TTF_$_pkgver

	install -d "${pkgdir}"/usr/share/fonts/TTF
	install -m644 */*.ttf "${pkgdir}"/usr/share/fonts/TTF
	install -D -m644 ../../OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
