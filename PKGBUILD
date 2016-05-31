# Maintainer: Otto Sabart <seberm@seberm.com>

pkgname=minetest-mod-mesecons
pkgver=20160515
pkgrel=1
pkgdesc="Mod for minetest that adds digital circuitry"
arch=('any')
url="https://github.com/Jeija/minetest-mod-mesecons"
license=('LGPLv3')
depends=('minetest-common')
makedepends=()
conflicts=()
source=("https://github.com/Jeija/minetest-mod-mesecons/archive/2016.05.15.tar.gz")
sha512sums=('cf250e6b2c130b32eab89d6257814a21f70da15b7688c5728886a861495fcebf5e0d7eb5e793278a88dcc5abb51bb21dceddf49155eec6f0eaa2c64729401b8e')

package() {
  install -d "${pkgdir}/usr/share/minetest/games/minetest/mods"
  rm -rf "${srcdir}/$pkgname/.gitignore"
  cp -r "${srcdir}/$pkgname" "${pkgdir}/usr/share/minetest/games/minetest/mods/mesecons"
}
