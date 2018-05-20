# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.2.0
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm-slick-greeter' 'polkit' 'python-gobject' 'python-setproctitle' 'python-xapp')
makedepends=('desktop-file-utils' 'gettext')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('7bf9ece76dc3f28b418bc68313de365e265cd6d50a27a5b3157d37e45e511e17')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
