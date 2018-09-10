# Maintainer: Carson Black <uhhadd@gmail.com>
pkgname=puyo
pkgver=0.5
pkgrel=1
pkgdesc="A frontend for pacman."
arch=('any')
url=""
license=('GPL')
groups=()
depends=('bash' 'pacman' 'yay')
backup=()
options=()
install=
changelog=
source=("https://github.com/Appadeia/puyo/archive/0.5.tar.gz")
noextract=()
md5sums=('78c1577d020773a0b2579043715073fd')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
}
