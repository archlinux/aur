# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=delft-icon-theme
pkgver=1.9
pkgrel=1
pkgdesc="Continuation of Faenza icon theme with up to date app icons"
arch=(any)
url="https://www.gnome-look.org/p/1199881/"
license=(GPL3)
options=(!strip)
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/madmaxms/iconpack-delft/releases/download/v${pkgver}/delft-iconpack.tar.xz")
sha256sums=('f3c10fb390dfefba69b13aa4e2d37e25e951413711d1fc75f1a8dbe88e177796')

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/Delft* ${pkgdir}/usr/share/icons
}
