
# Maintainer: anergy <anergy dot 25110321 at gmail dot com>
pkgname=keymap-jp106-capsctrl
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="modified jp106 console keymap to change caps to ctrl"
arch=(any)
url="http://example.com/dummy-url/"
license=('MIT')
depends=(kbd)
source=(jp106_capsctrl.map.gz)
noextract=(jp106_capsctrl.map.gz)

check() {
  return 0
}

package() {
  cd $srcdir
  install -D -m644 jp106_capsctrl.map.gz ${pkgdir}/usr/share/kbd/keymaps/i386/qwerty/jp106_capsctrl.map.gz
}

md5sums=('3999e7c0ff951846ed8ed423fd30b7df')
# vim:set ts=2 sw=2 et:
