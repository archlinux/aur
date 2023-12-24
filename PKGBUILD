# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.86.0
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('070183bc8ba5471c95c69f4fa9c90c88c4bd85baa56fbdcf05d13b734f17bfd0')
sha512sums=('ac58db27fe6788e6485a08bd9b692f2ea6fac2d3a44f7d7402d67e4393803cdb7e8c5f03fb95d501ac74724dd3ffe94c1899efa38689c719857fb3a46390b8c7')
b2sums=('5e3001d49cbed9f6b61d6a898190bf10f5049a280c5ba7d181eff69048a0b31be078912917f1d4e5abd6d5db5112cc6660e55a51e0f3523e471b8ea3a2fe3f97')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
