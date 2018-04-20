# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic
pkgver=0.3.12
pkgrel=1
pkgdesc='A graphical front end for managing Razer peripherals under GNU/Linux.'
arch=('any')
license=('GPL2')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/polychromatic/polychromatic/archive/v$pkgver.tar.gz")
url='https://github.com/polychromatic/polychromatic'
makedepends=('nodejs-less')
depends=('python' 'hicolor-icon-theme' 'python-openrazer' 'webkit2gtk' 'libappindicator-gtk3' 'imagemagick')
sha512sums=('e4099408f1543436ac8d1145f34631af59086542ba16c1f7b729f422d6555f5ce0ecfa0b49917cf73c88a0bf2467684001242b230833e994fa8c164c43fdad52')

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
