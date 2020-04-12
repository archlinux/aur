# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=delft-icon-theme
pkgver=1.12
pkgrel=1
pkgdesc="Continuation of Faenza icon theme with up to date app icons"
arch=(any)
url="https://www.gnome-look.org/p/1199881/"
license=(GPL3)
options=(!strip)
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/madmaxms/iconpack-delft/releases/download/v${pkgver}/delft-iconpack.tar.xz")
sha256sums=('4351c9fe3527c1c87489989b012f1ed0aa786c11af2aa0b79094a6cd4ce271b9')

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/Delft* ${pkgdir}/usr/share/icons
}
