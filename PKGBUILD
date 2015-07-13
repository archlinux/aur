# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
pkgver=8.0.01
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("http://unifoundry.com/pub/unifont-$pkgver/unifont-$pkgver.tar.gz")
md5sums=('b813e863f35e0f5f6235e73041c7b1a6')

package() {
	cd $srcdir
	install -d $pkgdir/usr/share/fonts/TTF/
	install -m644 unifont-$pkgver/font/precompiled/unifont-$pkgver.ttf $pkgdir/usr/share/fonts/TTF/Unifont.ttf
}
