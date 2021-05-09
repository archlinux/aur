# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=delft-icon-theme
pkgver=1.15
pkgrel=1
pkgdesc="Continuation of Faenza icon theme with up to date app icons"
arch=(any)
url="https://www.gnome-look.org/p/1199881/"
license=(GPL3)
options=(!strip)
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/madmaxms/iconpack-delft/releases/download/v${pkgver}/delft-iconpack.tar.xz")
sha256sums=('a80471ed4eb2f28f50d05ec90bfb178da6d1080df1db6d37e5abf6c47c0556bd')

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/Delft* ${pkgdir}/usr/share/icons
}
