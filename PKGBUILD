# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.85.0
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('7fb028aabdf579cffcd1014ca7bdea08bc615882973b87821fd8eed15b286a76')
sha512sums=('7c80b73b06073842e1929ab5c91e797c9840330375e45cf3f78b6a905affc12502fc68d816d9c6fd3db7eb096a96287d59801e26227aa51ff4ddeffd2df1b20b')
b2sums=('051f85923d1816ac043b4525acb65d4bf091453445e10fb189630bae30aa40eb761f1c26b95ba4b034d1446f1c184846e40de60ce669e9cb829ff4fda1c66eb3')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
