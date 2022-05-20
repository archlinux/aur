# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=ttf-unifont-csur
pkgver=14.0.03
pkgrel=1
pkgdesc="TrueType part of the GNU Unifont containing Michael Everson's ConScript Unicode Registry (CSUR) Private Use Area (PUA) glyphs"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('ttf-unifont')
url=https://unifoundry.com/unifont/index.html
source=(
	"http://unifoundry.com/pub/unifont/unifont-$pkgver/font-builds/unifont_csur-$pkgver.ttf"{,.sig}
)
sha512sums=('969ada59fdb8870bee92e03a88c5cf8f518a33c1467c7b7b432e018fd7da30f7eb0686e37bd8c5cdd5efedbe0888c7daf2dbb9a444161604f50b742867a67819'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

package() {
	cd "$srcdir"
	install -Dm644 "unifont_csur-$pkgver.ttf" \
		"$pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
