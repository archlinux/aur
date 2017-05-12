# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.0.5
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="http://packages.linuxmint.com/pool/main/l/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm' 'lightdm-slick-greeter' 'lsb-release' 'python-setproctitle'  'python-xapp')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('b0ebfd63606d14d4a85571cda7a793a5390971bb8bad43afb7f42226b55ef9f2')

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
