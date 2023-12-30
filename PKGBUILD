# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-mineclone2
pkgver=0.86.2
pkgrel=1
pkgdesc='Minecraft clone game for Minetest'
arch=('any')
url='https://git.minetest.land/MineClone2/MineClone2'
license=('GPL3')
depends=('minetest-common')
source=("mineclone2-$pkgver.tar.gz::https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.tar.gz")
sha256sums=('e344eb18311a92dcaebc6bc0961b4affb108e2d5cdba1c973f8d6b22b9664895')
sha512sums=('e8d11914d5a222420154a08b4d76fd18a7aa02864facb7be486099676d0646db8f25f68613665aba9bf233f3d67b4163068cf523e2f82bb35dd2cfeffdb91f30')
b2sums=('2079a79b26b3c528377dd0df93603cc79312d0b7110bdf328bf7d82947a812fd37fa0ee068e2390104735b1dbfb9cbf915215ce84560a5d2227e9848a312702e')

package() {
  cd mineclone2

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
