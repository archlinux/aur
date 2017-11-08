# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.1.3
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm-slick-greeter' 'lsb-release' 'polkit' 'python-gobject' 'python-setproctitle' 'python-xapp')
makedepends=('desktop-file-utils' 'gettext')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('8aa50dbb4dccf5a9f66dd62c909207639d6a82012bf5503af494ea105444fb52')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
