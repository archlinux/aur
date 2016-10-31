# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=9.0.04
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://unifoundry.com/pub/unifont-$pkgver/unifont-$pkgver.tar.gz")
md5sums=('a070dd0573111bec32873825292c8a2d')

package() {
	cd $srcdir
	install -d $pkgdir/usr/share/fonts/TTF/
	install -m644 unifont-$pkgver/font/precompiled/unifont-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont.ttf
	install -m644 unifont-$pkgver/font/precompiled/unifont_upper-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont_Upper.ttf
}

