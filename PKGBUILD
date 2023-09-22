# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@archlinux.org>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=otf-unifont
pkgver=15.1.02
pkgrel=1
pkgdesc="OpenType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
source=("https://unifoundry.com/pub/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"{,.sig})
sha256sums=('7631dbfb21614ca25a0f15ef74b60a50abda1798376bc36cbb7ea53c25ff123a'
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
