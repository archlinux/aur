# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=faience-ng-icon-theme
pkgver=20180320
pkgrel=1
pkgdesc="Continued development of Faenza\Faience Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1210208/"
license=('GPL3')
provides=('faience-ng-icon-theme')
conflicts=('faience-ng-icon-theme')
options=(!strip)
source=("https://github.com/faience/faience-ng-icon-theme/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c0bfd70e2e9ef88626b68235035849c4')

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/Faience* ${pkgdir}/usr/share/icons
}
