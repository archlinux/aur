# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: gileri <aur@linuxw.info>

pkgname=luanti-voxelibre
conflicts=('minetest-mineclone2' 'minetest-voxelibre')
replaces=('minetest-mineclone2' 'minetest-voxelibre')
pkgver=0.89.3
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Luanti'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('luanti-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('42b6ece083fef8500d805db7036fd85adfe8f3c4755c8ec010c106ce0cec3356')
sha512sums=('b00887728d0383a92cb9047c58353ae26d57b0839d5542ce1505f55f49be0d3e3905d13ce56e0963af48f0247f1ec7808a086fb7f06ec7c5ecd2959645d31585')
b2sums=('d0a29b9b0881233f9f6df39997ebe86237e9fedebe2f57d1cc99c380dc6ca67481122f737bacf81cba2e433c9dc175f113ccef8dcb615d8d8ec4dfbf98061653')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/luanti/games/voxelibre/$f"
  done
}
