# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@gmail.com>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=12.1.03
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"{,.sig})
sha256sums=('c1d56e1d2f6952a45fc2d38c5c2c52d715328714d385749451b7ec14ba1ab982'
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
