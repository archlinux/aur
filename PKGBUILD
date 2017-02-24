# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=otf-tenderness
pkgver=0.501
pkgrel=3
pkgdesc='Soft font inspired by Garamond and Optima'
arch=('i686' 'x86_64')
license=('custom:CC0')
url='http://dotcolon.net/font/?id=tenderness'
depends=('fontconfig' 'xorg-font-utils')
source=('http://dotcolon.net/DL/font/tenderness.zip')
sha256sums=('9c60c19375eb95e40e94852f4460d98d33e8b6774246099a326f28df85e9ba0d')

package() {
	install -d $pkgdir/usr/share/fonts/OTF/
	install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
}
