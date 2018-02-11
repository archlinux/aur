# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix

pkgname=delft-icon-theme
pkgver=0.3
pkgrel=1
pkgdesc="Continuation of Faenza icon theme with up to date app icons"
arch=('any')
url="https://www.gnome-look.org/p/1199881/"
license=('GPL3')
provides=('delft-icon-theme')
conflicts=('delft-icon-theme')
options=(!strip)
source=("https://github.com/madmaxms/iconpack-delft/releases/download/v${pkgver}/delft-iconpack.tar.xz")
md5sums=('2db097aa4ebdd46efa404861c522bb9d')

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/Delft* ${pkgdir}/usr/share/icons
}
