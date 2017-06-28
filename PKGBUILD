# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.1.1
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm-slick-greeter' 'lsb-release' 'polkit' 'python-gobject' 'python-setproctitle' 'python-xapp')
makedepends=('desktop-file-utils' 'gettext')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('be1c5a1db4e0c89e573bfc7aec39a067f9c32b4798e0b4e5dbdca6db3a5ce6ee')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
