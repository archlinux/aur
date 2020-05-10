# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=faience-ng-icon-theme
pkgver=20180320
pkgrel=1
pkgdesc="Continued development of Faenza\Faience Icon Theme"
arch=(any)
url="https://www.gnome-look.org/p/1210208/"
license=(GPL3)
provides=(faience-ng-icon-theme)
conflicts=(faience-ng-icon-theme)
options=(!strip)
source=("https://github.com/faience/faience-ng-icon-theme/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('85312296aa1ac62daa78b09b6ea5e63b016364b924dc8a5189e76ede441ffba4')

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/Faience* ${pkgdir}/usr/share/icons
}
