# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-voxelibre
conflicts=('minetest-mineclone2')
replaces=('minetest-mineclone2')
pkgver=0.87.1
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Minetest'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('minetest-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('8741ea9e3707e8b336fb354af24ecc3f0b0be0894795df1bbe2ffa8bf61fe61d')
sha512sums=('4d1fa4de406f546a768a36eefcbf95efd7e54c9bfbd533e1a03b21454d43a539d58dbc0c7bec9ed214c6f067628f669ab7cbb5f757ab01a9c842c57c22848295')
b2sums=('887e50ce18152201e4dfb43fd42bd3b62079866a25b1d680d6c38ba8e87efa29c04c3f394e3a82230810d69f91a69fe1e9602a110f3f61a17d60a08963300791')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
