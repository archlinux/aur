# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.83.0
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('dce696185a559a4bcdad599db1dd4a529f72bbe9e509e7f80cf171690d3efce9')
sha512sums=('d265328f1a44f4c6e33726ca6a2fdb054c9163db89fe94caca735721d767e66e45f8ecda87c07ba499dfd4ee8fc0766a843ee975161471fec9ebb04416fa33b1')
b2sums=('7a4c6d61a7d7f5101d3095b9d1390cf4db11c4b7fd650cd0c56f9a5bee0fcbb33574cdf58a7e220dfd42e7aca8e3b9a14001c9ac9a5bec51aeaff4d19d9d7904')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
