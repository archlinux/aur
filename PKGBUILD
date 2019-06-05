# Maintainer: Varshit Bhat <varshitbhat@gmail.com>

pkgname=litguish-git
pkgver=1.0
pkgrel=1
pkgdesc="litguish is the GUI Frontend for light backlight controller using shellscript (using yad for GUI)"
arch=('any')
url="https://gitlab.com/varshitbhat/litguish"
license=('GPLv3')
depends=('light' 'yad' 'libnotify')
source=('https://gitlab.com/varshitbhat/litguish/raw/master/litguish')
noextract=('litguish')
md5sums=('SKIP')

package() {
	install -Dm755 "${srcdir}/litguish" "${pkgdir}/usr/bin/litguish"
}
