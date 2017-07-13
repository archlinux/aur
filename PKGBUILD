# Maintainer: kertase <kertase at gmail dot com>

pkgname=ttf-unifont-csur
pkgver=10.0.05
pkgrel=1
pkgdesc="TrueType part of the GNU Unifont containing Michael Everson's ConScript Unicode Registry (CSUR) Private Use Area (PUA) glyphs"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('ttf-unifont')
source=(
	"http://unifoundry.com/pub/unifont-$pkgver/font-builds/unifont_csur-$pkgver.ttf"{,.sig}
)
sha512sums=(
	'ec08266f990f05e753a39db74dfd6d28972fc967a94c1820abd285855b0914ac7e0cd1bbff921ba53fe131b6514c29f7c8187c4b849fff5bcd85027dc032a4e9'
	'SKIP'
)
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

package() {
	cd "$srcdir"
	install -Dm644 "unifont_csur-$pkgver.ttf" \
		"$pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
