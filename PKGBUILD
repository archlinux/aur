# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.84.0
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('e7223ab4ec2c7615a684994f1480e75a45bf97ccd183fb7a1d0e657d28611b14')
sha512sums=('aeb5d425124b89a7b35a558763c58f5eab9f18f6eaf5ed56107f6b0c6c38816766b5449895ab657c28f8d7c4dfa8bc4445538a3adaab69ba43aa2e5691a94df8')
b2sums=('b2662b28a40b363bc0f7f1855dde10dbbaaa823a216f9c42ec882a6661f667086a29e0ef4a6c7bbfb9a5fa32c10588a8c6a222c8090272d4ff645df046d43eb3')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
