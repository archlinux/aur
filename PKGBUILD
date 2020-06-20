# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.66.2
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/Wuzzy/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/Wuzzy/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('13d272d38165d8897e1018ad296dcf3cf289fd7a2ce918a97f68a62a5229c379')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
