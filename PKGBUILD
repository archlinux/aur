# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: miwinning <miwinning@miwcloud.me>

pkgname=ttf-camingocode
pkgver=1.0
pkgrel=4
pkgdesc='A modern monospaced typeface designed for code editors'
arch=(any)
url="https://janfromm.de/typefaces/camingocode/"
license=('custom:CC-BY-ND 3.0')
source=("$pkgname-$pkgver.zip::https://janfromm.de/typefaces/camingocode/camingocode.zip")
sha256sums=('1ac164cbf2efdc5aacd75a0c77338acd080ebea785c60c81a0dfa0b68f485290')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" TTF/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" readme.txt
}
