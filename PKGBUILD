# Maintainer: Carson Black <uhhadd@gmail.com>
# Thanks to simonizor, e5ten, and greyfade for helping with bash scripting and packaging.
pkgname=puyo
pkgver=1.0
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
source=("https://github.com/Appadeia/puyo/archive/1.0.tar.gz")
noextract=()
md5sums=('ca2521da8b59c6a303cc8bfaf9606260')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
}
