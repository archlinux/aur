# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@gmail.com>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=13.0.01
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
source=(
"https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.ttf"{,.sig}
"https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont_csur-$pkgver.ttf"{,.sig}
"https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont_jp-$pkgver.ttf"{,.sig}
"https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont_upper-$pkgver.ttf"{,.sig}
)
sha256sums=('8f3d8b12841ad564ef649c1c302248efa8c53dd40b603c9ad1335d58e269ab78'
            'SKIP'
            '0d09b80116163a332e39d723e9867e0f340abf3e3f8acbfa9dcabd7b977a37bd'
            'SKIP'
            '961c85507bc4e7918e5335004daf2ca84d24427e77eef47e114420b42d12a05b'
            'SKIP'
            '674ba01bb6c245023b47d7a846983fe0cebe6358e77d1e6764bf846411d640da'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/share/fonts/Unifont/"
	install -m644 "unifont-$pkgver.ttf" "$pkgdir/usr/share/fonts/Unifont/Unifont.ttf"
	install -m644 "unifont_jp-$pkgver.ttf" "$pkgdir/usr/share/fonts/Unifont/Unifont_jp.ttf"
	install -m644 "unifont_upper-$pkgver.ttf" "$pkgdir/usr/share/fonts/Unifont/Unifont_Upper.ttf"
	install -m644 "unifont_csur-$pkgver.ttf" "$pkgdir/usr/share/fonts/Unifont/Unifont_CSUR.ttf"
}
