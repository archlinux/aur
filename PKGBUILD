# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.0.7
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="http://packages.linuxmint.com/pool/main/l/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm' 'lightdm-slick-greeter' 'lsb-release' 'python-setproctitle'  'python-xapp')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('1d389f4f0f1e0b19276fd03e9d98615151aa019c922a2898dbf0c49cf455eea7')

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
