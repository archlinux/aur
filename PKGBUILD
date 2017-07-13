# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=10.0.05
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("http://unifoundry.com/pub/unifont-$pkgver/unifont-$pkgver.tar.gz")
sha256sums=('8b85367401729bf22217c44d914dee08770665ff01b5faccb7760a2a06934a1f')

package() {
	cd $srcdir
	install -d $pkgdir/usr/share/fonts/TTF/
	install -m644 unifont-$pkgver/font/precompiled/unifont-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont.ttf
	install -m644 unifont-$pkgver/font/precompiled/unifont_upper-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_Upper.ttf
	install -m644 unifont-$pkgver/font/precompiled/unifont_csur-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf
}

