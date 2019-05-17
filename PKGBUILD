# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@gmail.com>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=12.1.01
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"{,.sig})
sha256sums=('67c9b14cd6cbd07552940e86125ffcada70cbc74f866a67b843e524bbfd07d51'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy

package() {
	cd $srcdir
	install -d $pkgdir/usr/share/fonts/TTF/
	install -m644 unifont-$pkgver/font/precompiled/unifont-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont.ttf
	install -m644 unifont-$pkgver/font/precompiled/unifont_upper-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_Upper.ttf
	install -m644 unifont-$pkgver/font/precompiled/unifont_csur-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf
}
