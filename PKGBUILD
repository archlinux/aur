# Maintainer: Sam Burgos < santiago.burgos1089@gmail.com >

pkgname=wine-installer
pkgver=4.0.5
pkgrel=3
pkgdesc='A metapackage that provides desktop files and menus to WINE'
arch=(x86_64)
url="http://packages.linuxmint.com/pool/main/w/${pkgname}"
license=(GPL)
optdepends=('winetricks: Script to install various redistributable runtime libraries in Wine.')
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('b360b6c34e2fbc84fd959caa204ba48c850db5fb437487ff2516e67c0632057f')

package() {
  cd ${pkgname}
  cp -r usr "$pkgdir"
  cp -r etc "$pkgdir"
}
