# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=ttf-unifont-csur
pkgver=15.0.01
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
sha512sums=('d53ebbbb2ce34031d944c50c07fd1c2fc7d1b762d4396a00f3cf62514bd9adc3d7fafe26305b6c080a93e928db657a16aa472a75982bee76a2882f1a593a81b6'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

package() {
	cd "$srcdir"
	install -Dm644 "unifont_csur-$pkgver.ttf" \
		"$pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
