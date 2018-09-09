# Maintainer: Carson Black <uhhadd@gmail.com>
pkgname=puyo
pkgver=0.3
pkgrel=1
pkgdesc="A frontend for pacman."
arch=('any')
url=""
license=('GPL')
groups=()
depends=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Appadeia/puyo/archive/0.3.tar.gz")
noextract=()
md5sums=('2ea19b01ea20d38c32bd468aac2c1526')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
}
