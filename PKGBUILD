# Maintainer: kertase <kertase at gmail dot com>

pkgname=ttf-unifont-csur
pkgver=10.0.01
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
	'e0ad70996ba9aaf6ff9ec6570ecdb7db2db045ef6d30a80ce9dd83953fc3bc5f13ccbbf5c2d23e192b6e48df964c1d53120d0780837cccdb12299803f189fd25'
	'SKIP'
)
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

package() {
	cd "$srcdir"
	install -Dm644 "unifont_csur-$pkgver.ttf" \
		"$pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
