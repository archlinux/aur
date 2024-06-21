# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=minetest-voxelibre
conflicts=('minetest-mineclone2')
replaces=('minetest-mineclone2')
pkgver=0.87.1
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Minetest'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('minetest-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('8cb2ec2df43e66fe397449c3fbed5be3ad7b94c37e128f573d4b3dd74c970e27')
sha512sums=('3e313d9c007ff676d31dc34ab1da227b6c1fb30491dc92ad0eef8b862c694aba56a09799854ea325ac464f7f68cdd44b9576e873b0966845d2f40641510789ba')
b2sums=('dca5127ed9f9b77bc0646d54b7560efc4d67118ca9602aa08dfb94b81f3e97d2d51eb207ba248b507308748b54487e0b8efd66b1cebf84087c492d44998cbf4b')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/mineclone2/$f"
  done
}
