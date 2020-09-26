# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.67.2
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/Wuzzy/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.zip::https://content.minetest.net/packages/Wuzzy/mineclone2/releases/4921/download/")
sha256sums=('39c2482c3d3937a787cdb7d0f6909049a5af2027d2d22f9b50501561daab30b3')

package() {
  #cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
