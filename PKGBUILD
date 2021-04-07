# Maintainer: Sam Burgos < santiago.burgos1089@gmail.com >

pkgname=wine-installer
pkgver=5.0.3
pkgrel=2
pkgdesc='A metapackage that provides desktop files and menus to WINE'
arch=(x86_64)
url="https://github.com/linuxmint/wine-installer"
license=(GPL)
depends=(
    wine
    winetricks
)
#conflicts=(
#    wine-gui-git
#)
source=("${pkgname}-${pkgver}.tar.xz::http://packages.linuxmint.com/pool/main/w/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('bef0ddc08fe5143eaca2093221e96af33fdd921d6766d34ee3972476a43f070e')

package() {
  cd ${pkgname}
  cp -r usr "$pkgdir"
  cp -r etc "$pkgdir"
}
