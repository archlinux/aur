# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.0.4
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="http://packages.linuxmint.com/pool/main/l/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm' 'lightdm-slick-greeter' 'lsb-release' 'python-setproctitle'  'python-xapp')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('bd6f1a021709f3c1bee0e371efdc46f15f447ceb6aceee549141af732e15a053')

prepare() {
  cd ${pkgname}
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  cp -r usr "$pkgdir"
}
