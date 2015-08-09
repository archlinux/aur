# Maintainer:   Lucky <archlinux@builds.lucky.li>
# Contributor:  Farhad Shahbazi <farhad@enthusiasm.cc>

pkgname=ttf-mensch
pkgver=0.1
pkgrel=3
url="http://robey.lag.net/2010/06/21/mensch-font.html"
license=("custom")
depends=("fontconfig" "xorg-fonts-encodings" "xorg-font-utils")
pkgdesc="Mensch - A coding font"
arch=("any")
source=("http://robey.lag.net/downloads/mensch.ttf")
install=${pkgname}.install
md5sums=("0679909f76e436ccc183e7d93fe723d7")
sha1sums=("1c35c03a5ce085a602d92d0fe6200e03fc9665de")

package() {
  install -Dm644 mensch.ttf "$pkgdir/usr/share/fonts/TTF/mensch.ttf"
}
