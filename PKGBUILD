# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@archlinux.org>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=otf-unifont
pkgver=15.1.01
pkgrel=1
pkgdesc="OpenType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
source=("https://ftpmirror.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"{,.sig})
sha256sums=('e15f4209a2f7937951681f4522b21a4deb9fb36220c82f8b8cb66e2b1466cdb7'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/share/fonts/Unifont/"
	install -m644 "unifont-$pkgver/font/precompiled/unifont-$pkgver.otf" "$pkgdir/usr/share/fonts/Unifont/Unifont.otf"
	install -m644 "unifont-$pkgver/font/precompiled/unifont_jp-$pkgver.otf" "$pkgdir/usr/share/fonts/Unifont/Unifont_jp.otf"
	install -m644 "unifont-$pkgver/font/precompiled/unifont_upper-$pkgver.otf" "$pkgdir/usr/share/fonts/Unifont/Unifont_Upper.otf"
	install -m644 "unifont-$pkgver/font/precompiled/unifont_csur-$pkgver.otf" "$pkgdir/usr/share/fonts/Unifont/Unifont_CSUR.otf"
}
