# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=delft-icon-theme
pkgver=1.2
pkgrel=1
pkgdesc="Continuation of Faenza icon theme with up to date app icons"
arch=('any')
url="https://www.gnome-look.org/p/1199881/"
license=('GPL3')
provides=('delft-icon-theme')
conflicts=('delft-icon-theme')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/madmaxms/iconpack-delft/releases/download/v${pkgver}/delft-iconpack.tar.xz")
md5sums=('224713e20780c6c0187b91d10900ab3e')

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/Delft* ${pkgdir}/usr/share/icons
}
