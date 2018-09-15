# Maintainer: Vladimir Navrat <vn158@seznam.cz>

pkgname=ardublock
pkgver=Update1026
pkgrel=1
pkgdesc="Physical computing with Arduino as easy as drag-and-drop"
arch=('any')
license=('GPL3')
url="https://github.com/Elecrow-keen/Ardublock"
depends=('arduino')
source=(https://github.com/Elecrow-keen/Ardublock/raw/8104ca2f7a0c585649d646bfa4d82773404bb184/target/ardublock-all.jar)
md5sums=('2c93ac0c28c7a978a1bd0c9e60f1debe')

package() {
  mkdir -p "$pkgdir"/usr/share/arduino/tools/ArduBlockTool/tool
  install -D -m644 "$srcdir"/ardublock-all.jar "$pkgdir"/usr/share/arduino/tools/ArduBlockTool/tool
}