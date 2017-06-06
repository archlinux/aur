# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.0.9
pkgrel=2
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'lightdm-slick-greeter' 'lsb-release' 'polkit' 'python-gobject' 'python-setproctitle' 'python-xapp')
makedepends=('desktop-file-utils' 'gettext')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('36a75af7bdc4bb78b7965f2c3318f2892ef51db7fc32f8da91519b110a27a770')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
