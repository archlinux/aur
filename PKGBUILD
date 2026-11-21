# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=orion-32-control-panel
pkgver=0.5.0
pkgrel=1
pkgdesc='A fast, modern, cross-platform rewrite of the Orion 32 control panel'
arch=('x86_64')
url='https://github.com/synthead/orion-32-control-panel'
license=('MIT')
depends=('xdg-utils')
source=(
  "https://github.com/synthead/orion-32-control-panel/releases/download/v$pkgver/orion-32-control-panel-linux-x86_64"
  'antelope-orion-32-hid.rules'
)
sha256sums=(
  '52a7d7298676dc0bbfb2537e8aa2673667b85830c8640096b2a49b7459445fa3'
  'c38580d27d7aa76c3385fcd0f4ba63284545a1682babd05dbb7179c1217073ab'
)

package() {
  install -Dm 755 orion-32-control-panel-linux-x86_64 $pkgdir/usr/bin/orion-32-control-panel
  install -Dm 755 antelope-orion-32-hid.rules $pkgdir/etc/udev/rules.d/antelope-orion-32-hid.rules
}
