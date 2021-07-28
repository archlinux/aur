# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgname=ttf-brill
pkgdesc='Brill Typeface by John Hudson for Brill Publishing House'
pkgver=4.000.073
_tag="${pkgver:0:3}"
pkgrel=1
url=https://brill.com/page/BrillFont/brill-typeface
license=(custom)
arch=(any)
source=("https://brill.com/fileasset/The_Brill_Typeface_Package_v_${_tag/./_}.zip")
sha256sums=('8312c35f9c273de4884511f60f5701c7ef6a1c8062f015b88f3c05fde66cd8dd')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" Brill-*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" Brill_*_agreement.pdf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" Brill_*_use.pdf
}
