# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.66.1
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/Wuzzy/MineClone2'
license=('GPL3')
depends=('minetest')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/Wuzzy/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('da544e87d8917db0656d0b2d5530fa3eb8903f9fe3a162b8e10fbb8c8ac97ef1')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
