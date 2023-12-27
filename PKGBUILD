# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.86.1
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('6ffc084ad564f578ccece777592d65a42dec81dc96154037ec398e2feaa57f83')
sha512sums=('2e4db0c78aca07899fc75bb6ec11b6ab69a3f5ca6cce0f10eb07e677ac3fad62747f5b6bc8b4e518ed89d09ede1b128335f0fc227ab222c2b9a30a55bef1d82b')
b2sums=('82bd2b3a0d0209e921c6154fe31be9a388d2b68d66d93a879e5ebced114427c91436a0cc478f7728a17457fb513188ab2c11326d49031b618f0e7978d08d8f6c')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
