# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@gmail.com>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=12.1.04
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
sha256sums=('5e404613c970866884836ce1f1aa756210498b08ff132ab1d3c3eb5073c7e19d'
            'SKIP'
            '247198ef0a75ec881db5b234edf91221cf364b66a8bf16eec83a1a2962a825d7'
            'SKIP'
            '1c9f21e2ee22a0ecb2d187e1d32beac649504dcaadb834552566b4d135a1145c'
            'SKIP'
            'bc60d1117333e97045a45df0863ffc15a13714d64ef84e76688675b126df1c31'
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
