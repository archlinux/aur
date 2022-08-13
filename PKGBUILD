# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.78.0
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('bb531f81b64776fd8dbd7266083a2086e5f353d24a71945d6aa7d73767237909')
sha512sums=('6bdc9b92a239c22ecb8044f9956e5802e13ef5c16a0175c53342c430fe5a5b902c9c2b9a075e8da8c4f78f1aca8fd960bc95164ef3e3959f5435902b5d48f31a')
b2sums=('1de953d8425492291fea068cead46c62bce936200786206190fde0ddaad76dbd5233154b2091966dea8774a522eeadc9758ce24dc046ebe9e3a4fcd2e17742b6')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
