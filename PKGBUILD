# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-voxelibre
conflicts=('minetest-mineclone2')
replaces=('minetest-mineclone2')
pkgver=0.87.2
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Minetest'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('luanti-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('b5dd88266660ceaf4f37e8ea3925dc276e15a7edc8bcf0b3442869a76dd2de3b')
sha512sums=('a453d22723db31bcad1fd28fb528564fe6322914a608a0fc2646eb654c3e6f8ba3a4212d3b1d5a930a22a779eb646f925c43a55714b3e631b8205e2ebcae6ad6')
b2sums=('c3c0f9a8aa3062b96322a7023d2cb319ae470f4303b049266642350ada2518e784efd1e508c313546ad49be8d5bff922e6ab7743ae5c2e6488ccdccf984c0031')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/luanti/games/voxelibre/$f"
  done
}
