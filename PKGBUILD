# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=gnome-icon-theme-xfce
pkgver=0.6
pkgrel=1
pkgdesc="Extra Xfce icons for the GNOME icon theme"
arch=('any')
url="https://launchpad.net/gnome-icon-theme-xfce"
license=('GPL')
depends=('gnome-icon-theme' 'adwaita-icon-theme')
source=(https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-source-${pkgver}.tar.gz)
install=${pkgname}.install
sha256sums=('ee250311d8eff7dbfe6b7bd8e736e3dbc5e21a88f1808bc6aa6d5f0ff175b3ae')

package() {
  cp -R ${srcdir}/${pkgname}/usr ${pkgdir}
}
