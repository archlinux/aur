# Maintainer: Carson Black <uhhadd@gmail.com>
# Thanks to simonizor, e5ten, and greyfade for helping with bash scripting and packaging.
pkgname=puyo
pkgver=0.6
pkgrel=1
pkgdesc="A frontend for pacman and yay."
arch=('any')
url="https://github.com/Appadeia/puyo"
license=('GPL')
groups=()
depends=('bash' 'pacman' 'yay')
backup=()
options=()
install=
changelog=
source=("https://github.com/Appadeia/puyo/archive/0.6.tar.gz")
noextract=()
md5sums=('bb3620d88a436a99c38791bdbe4c9555')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
}
