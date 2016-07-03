# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=9.0.01
_pkgver=9.0
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://unifoundry.com/pub/unifont-$pkgver/unifont-$pkgver.tar.gz")
md5sums=('7f36b2600a60f74b9595cc31c3699ebd')

package() {
	cd $srcdir
	install -d $pkgdir/usr/share/fonts/TTF/
	install -m644 unifont-$_pkgver/font/precompiled/unifont-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont.ttf
}
