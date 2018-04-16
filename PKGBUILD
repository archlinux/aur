# Maintainer: Parker Johansen <johansen.parker@gmail.com>
pkgname=ttf-sega
pkgver=1.0
pkgrel=2
pkgdesc="Font designed by Sega Games Co., Ltd. for their logo and products"
arch=('any')
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-sega.install
source=('https://www.dafont.com/sega.font')

package() {
	install -Dm0644 SEGA.ttf $pkgdir/usr/share/fonts/TTF/Sega.ttf
}

sha256sums=('fdeb4bd3b0490888ac6c511686eccf9841a5841783e25c6bd0ee5f70ef4a3889')
