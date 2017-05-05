# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.0.3
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="http://packages.linuxmint.com/pool/main/l/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm' 'lightdm-slick-greeter' 'lsb-release' 'python-setproctitle'  'python-xapp')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('e2516597948fb4cdd213944a198befe43ff5df0242569430daeff37fb15fb8e7')

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
