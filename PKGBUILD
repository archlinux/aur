# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgname=ttf-brill
pkgdesc='Brill Typeface by John Hudson for Brill Publishing House'
pkgver=4.000.073
_tag="${pkgver:0:3}"
pkgrel=2
url=https://brill.com/page/BrillFont/brill-typeface
license=(custom)
arch=(any)
source=("$pkgname-$pkgver-$pkgrel.zip::https://brill.com/fileasset/The_Brill_Typeface_Package_v_${_tag/./_}.zip")
sha256sums=('5575fbca12d5f8f50b8613bf01ae373f4237fcb2fdf5a379e7378f477e54352e')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" Brill-*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" Brill_*_agreement.pdf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" Brill_*_use.pdf
}
