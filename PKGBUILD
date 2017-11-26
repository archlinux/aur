# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.1.4
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm-slick-greeter' 'lsb-release' 'polkit' 'python-gobject' 'python-setproctitle' 'python-xapp')
makedepends=('desktop-file-utils' 'gettext')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('264eee65a2a7d07a3f5a3ea2c02cd1988bf2c285751b3a0aebbf6b0f329a201c')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
