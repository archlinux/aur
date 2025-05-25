# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: gileri <aur@linuxw.info>

pkgname=luanti-voxelibre
conflicts=('minetest-mineclone2' 'minetest-voxelibre')
replaces=('minetest-mineclone2' 'minetest-voxelibre')
pkgver=0.89.4
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Luanti'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('luanti-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('e848569679318087fa187647388d129019cb58b8451978dc2b653b08a9bf781c')
sha512sums=('20d5759554793dbdf159c942dadab2a50f74b10c63511f8ff961c524112061a68ddc7e25ef1d32680f69087348000de9ba165628792707a508459839aee1c988')
b2sums=('55e5e702a1d0da1648bac6d577272d04e4d57a206cc41f72aa53bb5c6c0d1952ba1dd03757e1f2ea6ce967b0172ab5d136a2082359a5a35d3d6a9b3ff2a5b5ec')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/luanti/games/voxelibre/$f"
  done
}
