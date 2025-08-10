# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: gileri <aur@linuxw.info>

pkgname=luanti-voxelibre
conflicts=('minetest-mineclone2' 'minetest-voxelibre')
replaces=('minetest-mineclone2' 'minetest-voxelibre')
pkgver=0.90.1
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Luanti'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('luanti-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('a27ce408127b69993fbd34ae9e61b505f6e98ed3f88a283245a8d746431edd09')
sha512sums=('bf61b392bf3c7685c5ed52ee1859676bf1f312591692df7cca66651db2a1df6850a4ed0591706c61ace6c433d62489f859ace599da94530a3f0fae1ab5f51557')
b2sums=('c4b9e1677eab50f7932717e67f45cc537c12439ab36d40b9540a90534ed2556ba02c8bc75a09339feec3134ef6b3d502ab2fd6fbe45ed1c5679fa08b6c6e19b2')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/luanti/games/voxelibre/$f"
  done
}
