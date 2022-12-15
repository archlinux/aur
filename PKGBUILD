# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.81.1
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('43354cfd638bd101db7071a95c9ee9033e0dae3605fd0c85e5b34c1890b0a151')
sha512sums=('9b5ff56f5cc056edf550da9b7bb271d4ab4839c8cbfd5a0c3d14e3f93fa4d70f51846b98c43211b692baf1a319ed8c90572dc4b4662ca59e79da293f2697083e')
b2sums=('19dde5d521ace0d04e18f9751432b52aaeb1a697a2fecc062947dd94fafcded9fee0d42b27f44d89b611ea8536329f9276d3a4d601cc8c535a16a116a41e88c9')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
