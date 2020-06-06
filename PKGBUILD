# Maintainer: Sam Burgos < santiago.burgos1089@gmail.com >

pkgname=wine-installer
pkgver=5.0.2
pkgrel=1
pkgdesc='A metapackage that provides desktop files and menus to WINE'
arch=(x86_64)
url="http://packages.linuxmint.com/pool/main/w/${pkgname}"
license=(GPL)
depends=(
    wine
)
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('24c4c3641e418f5db95ccb7e67a34a8d67c2a40f489baebb8ef54495ef9c6867')

package() {
  cd ${pkgname}
  cp -r usr "$pkgdir"
  cp -r etc "$pkgdir"
}
