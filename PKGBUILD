# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=delft-icon-theme
pkgver=1.11
pkgrel=1
pkgdesc="Continuation of Faenza icon theme with up to date app icons"
arch=(any)
url="https://www.gnome-look.org/p/1199881/"
license=(GPL3)
options=(!strip)
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/madmaxms/iconpack-delft/releases/download/v${pkgver}/delft-iconpack.tar.xz")
sha256sums=('27eaecfd71aacb574c999bc53ebc13888c28826c4ca3ac034cad77dbdaa28eaf')

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/Delft* ${pkgdir}/usr/share/icons
}
