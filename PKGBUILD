# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.82.0
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('1b2e886468baf9bd422ef3d7e1a85a3b98b7c622c7a322baf6c0561f7f378e89')
sha512sums=('558885cbf00910bbeb3a3d1cf189b48e76c76635b621d7ceff079aedd19f0ec2be640e3a1d0c979b54129137791e3ed4daedc5931fab235fb687eb763bea1d21')
b2sums=('59aa54ed22a9b9349c3c2c465a288ece87824e36da7bd7f69eac631612012b3bcb1300609e4e2af9cdd990c02fab0a9a3a1882edd917c4ee8dc11f07441e4ac0')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
