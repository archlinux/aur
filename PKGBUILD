# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=10.0.06
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("http://unifoundry.com/pub/unifont-$pkgver/unifont-$pkgver.tar.gz")
sha256sums=('57787f256f18ff4686c700eaa51d75a7693b7aa8a975581f50becec53f7d147d')

package() {
	cd $srcdir
	install -d $pkgdir/usr/share/fonts/TTF/
	install -m644 unifont-$pkgver/font/precompiled/unifont-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont.ttf
	install -m644 unifont-$pkgver/font/precompiled/unifont_upper-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_Upper.ttf
	install -m644 unifont-$pkgver/font/precompiled/unifont_csur-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_CSUR.ttf
}

