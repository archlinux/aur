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
	install -Dm0644 SEGA.ttf $pkgdir/usr/share/fonts/TTF/Sega.ttf
}

sha256sums=('cb0147491c511738dd4bbb75f4f0fed65c27a331508cf1dc15d38f8132af724b')
