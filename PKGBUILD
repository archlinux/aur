# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=vok_sk
pkgver=1.0
pkgrel=13
pkgdesc="Vogo's Keyboard for Xorg 7 (Slovak)"
arch=(any)
url="http://www.abclinuxu.cz/blog/origami/2006/12/21/162644"
license=("custom")
depends=('grep' 'qizxopen' 'perl')
install=vok_sk.install
source=(https://gitlab.com/vojta_vogo/vok/raw/master/xorg/${pkgname})
md5sums=('2a99ad4873dda74f1a44e16e5d603df1')

package() {
  install -Dm644 $srcdir/vok_sk $pkgdir/usr/share/xkeyboard-config-2/symbols/vok_sk
}
