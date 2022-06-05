# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@archlinux.org>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=14.0.04
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
source=("https://ftpmirror.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"{,.sig})
sha256sums=('1f5e517ccf4cb3a09cffe31ac52de70d8f076fe024a4a2453e07db57bb64febb'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/share/fonts/Unifont/"
	install -m644 "unifont-$pkgver/font/precompiled/unifont-$pkgver.ttf" "$pkgdir/usr/share/fonts/Unifont/Unifont.ttf"
	install -m644 "unifont-$pkgver/font/precompiled/unifont_jp-$pkgver.ttf" "$pkgdir/usr/share/fonts/Unifont/Unifont_jp.ttf"
	install -m644 "unifont-$pkgver/font/precompiled/unifont_upper-$pkgver.ttf" "$pkgdir/usr/share/fonts/Unifont/Unifont_Upper.ttf"
	install -m644 "unifont-$pkgver/font/precompiled/unifont_csur-$pkgver.ttf" "$pkgdir/usr/share/fonts/Unifont/Unifont_CSUR.ttf"
}
