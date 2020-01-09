# Maintainer: kertase <kertase at gmail dot com>

pkgname=ttf-unifont-csur
pkgver=12.1.04
pkgrel=1
pkgdesc="TrueType part of the GNU Unifont containing Michael Everson's ConScript Unicode Registry (CSUR) Private Use Area (PUA) glyphs"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('ttf-unifont')
source=(
	"http://unifoundry.com/pub/unifont/unifont-$pkgver/font-builds/unifont_csur-$pkgver.ttf"{,.sig}
)
sha512sums=(
	'8636e37e76265679b06df6a2373e2d1c53df637cb67b0b05ab840b3db97c8850fab05b12dd550fd06c4452b6f2383648187907ce7173a868bebd28c72927a0d1'
	'SKIP'
)
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

package() {
	cd "$srcdir"
	install -Dm644 "unifont_csur-$pkgver.ttf" \
		"$pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
