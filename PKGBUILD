# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=delft-icon-theme
pkgver=1.14
pkgrel=1
pkgdesc="Continuation of Faenza icon theme with up to date app icons"
arch=(any)
url="https://www.gnome-look.org/p/1199881/"
license=(GPL3)
options=(!strip)
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/madmaxms/iconpack-delft/releases/download/v${pkgver}/iconpack-delft.tar.xz")
sha256sums=('1873f97c484a6c35041f324dbb49a341d2bb39314dfc6c27c9cffc8f4d69f2a4')

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/Delft* ${pkgdir}/usr/share/icons
}
