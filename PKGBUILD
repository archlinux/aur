# Maintainer: kertase <kertase at gmail dot com>

pkgname=ttf-unifont-csur
pkgver=11.0.01
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
	'a940e7e5f520df9d6796f0a24dc1f78ad0105dc595d85425135e17de780ee14fe230bfe84ad6a8b2192635f5b86736a2c3a194575838ca7f5c476f67c9d311b1'
	'SKIP'
)
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

package() {
	cd "$srcdir"
	install -Dm644 "unifont_csur-$pkgver.ttf" \
		"$pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
