# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=otf-tenderness
pkgver=0.501
pkgrel=1
pkgdesc='Soft font inspired by Garamond and Optima'
arch=('i686' 'x86_64')
license=('custom:CC0')
url='http://www.dotcolon.net/font/?id=tenderness'
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.dotcolon.net/DL/font/tenderness.zip')
md5sums=('456c805ca3b6a249834f064ee3035c2e')
install=$pkgname.install

package() {
	install -d $pkgdir/usr/share/fonts/OTF/
	install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
}
