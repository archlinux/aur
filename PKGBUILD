# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.0.6
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="http://packages.linuxmint.com/pool/main/l/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm' 'lightdm-slick-greeter' 'lsb-release' 'python-setproctitle'  'python-xapp')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('2c8d349bc010d33e760a2ebb5548a4b7a52a52bf03d49b4749cec2ee43589a93')

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
