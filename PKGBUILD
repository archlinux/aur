# Maintainer: Parker Johansen <johansen.parker@gmail.com>
pkgname=ttf-sega
pkgver=1.0
pkgrel=1
pkgdesc="Font designed by Sega Games Co., Ltd. for their logo and products"
arch=('any')
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-sega.install
source=('https://www.dafont.com/sega.font')

package() {
	install -Dm0644 sega.ttf $pkgdir/usr/share/fonts/TTF/Sega.ttf
}

sha256sums=('00705917db8dff81592fffd9ac67f853f88198121014e647a6655be5cda8d6dc')
