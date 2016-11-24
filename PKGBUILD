# Maintainer: macxcool mark dot coolen at gmail dot com

pkgname=ttf-shlomo
pkgver=1
pkgrel=1
pkgdesc="Derivatives of the Ezra SIL SR hebrew font."
arch=('any')
url="https://sites.google.com/site/orlaeinayim/introduction-to-fonts-with-hebrew-cantillation-marks"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("Schlomo.ttf::https://sites.google.com/site/orlaeinayim/Shlomo.ttf?attredirects=0" \
	"SchlomoLightBold.ttf::https://sites.google.com/site/orlaeinayim/ShlomoLightBold.ttf?attredirects=0" \
	"SchlomoBold.ttf::https://sites.google.com/site/orlaeinayim/ShlomoBold.ttf?attredirects=0" \
	"SchlomoStam.ttf::https://sites.google.com/site/orlaeinayim/ShlomoStam.ttf?attredirects=0" \
	"SchlomosemiStam.ttf::https://sites.google.com/site/orlaeinayim/ShlomosemiStam.ttf?attredirects=0" \
	"OFL.txt::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt")
sha1sums=('95450a27c8a646ae0295e67211e738824c229d89' \
	  '9206bae538bfc764901d9fd25fcbfcd57028cee8' \
	  '31c3c21c700000ca124b5ca8c5f846ecc8b0136c' \
	  '55cbeb9ccbb4ab5a53971f342bd0e7413a34a8e8' \
	  '3414918a9420dcb7eb68a7eaaaa5a6ccf13ef82f' \
	  '84e2137ba63c1983a1e36371fc7e08ef5d94542e')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
