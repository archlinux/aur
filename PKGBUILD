# Maintainer: kertase <kertase at gmail dot com>

pkgname=ttf-unifont-csur
pkgver=10.0.04
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
	'3553ffb206abb25d784a8303e3ba180de84ecc44093155f7e44a3062158e00388fd9545be8a441f4e2ec2ec11df07a9a9ffb2b9dcf3215c259b5af3ea86ffc4c'
	'SKIP'
)
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

package() {
	cd "$srcdir"
	install -Dm644 "unifont_csur-$pkgver.ttf" \
		"$pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
