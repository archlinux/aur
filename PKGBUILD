# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: gileri <aur@linuxw.info>

pkgname=luanti-voxelibre
conflicts=('minetest-mineclone2' 'minetest-voxelibre')
replaces=('minetest-mineclone2' 'minetest-voxelibre')
pkgver=0.88.1
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Luanti'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('luanti-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('0502767fcd912e1f746993b59deca9bc8d7dde5f2a3138c29c9e9a79b497d0a9')
sha512sums=('cabed44ca7be5c148f83816945a980fde8e37155f1803d1b5ac4063415271e569cc9d6aec0587d663db0765ed306a22b5b83a1240e963876da70fe761bc2858f')
b2sums=('652db4909b2fdf32a43bace585acaa5f8f95a0521e5ba5182dc5e2ba8f3ef8611547c3242490a9eb6884219a6f272a747bbcb2aacafd9642a6f6f14234f1b4fa')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/luanti/games/voxelibre/$f"
  done
}
