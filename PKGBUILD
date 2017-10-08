# Maintainer: Francisco Domínguez Lerma <francisco.dominguez.lerma@gmail.com>
pkgname=poketty
pkgver=git
pkgrel=1
pkgdesc="Pokemon battle simulator for tty, .pkg files not included"
arch=('any')
url="https://github.com/sonozaki/poketty.git"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/sonozaki/poketty/archive/master.zip)
noextract=()
md5sums=('7755c2b7bcf25ba0e192bda9fde67520')

build() {
  cd "$srcdir/poketty-master"
  make

}

package() {

cd "$srcdir/poketty-master"
mkdir -p "$pkgdir/usr/bin"
cp poketty "$pkgdir/usr/bin/"

}
