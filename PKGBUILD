# Maintainer: Carson Black <uhhadd@gmail.com>
pkgname=puyo
pkgver=0.3
pkgrel=2
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
source=("https://github.com/Appadeia/puyo/archive/0.4.tar.gz")
noextract=()
md5sums=('2a2d33f2a7d3c114ec81df7321558521')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
}
