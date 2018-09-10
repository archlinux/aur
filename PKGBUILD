# Maintainer: Carson Black <uhhadd@gmail.com>
# Thanks to simonizor, e5ten, and greyfade for helping with bash scripting and packaging.
pkgname=puyo
pkgver=0.7
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
source=("https://github.com/Appadeia/puyo/archive/0.7.tar.gz")
noextract=()
md5sums=('688e2b33cc36b7e1d9408ab252444b8a')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
}
