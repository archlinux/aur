# Maintainer: Francisco Domínguez Lerma <francisco.dominguez.lerma@gmail.com>
pkgname=poketty
pkgver=1.4
pkgrel=1
pkgdesc="Pokemon battle simulator for tty"
arch=('any')
url="hispagnu.org/poketty"
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
source=(http://hispagnu.org/poketty/releases/poketty1.4.tar.gz)
noextract=()
md5sums=('30006ef3e115a446b544e39ecda107e4')

build() {
  cd "$srcdir/poketty1.4"
  make

}

package() {

cd "$srcdir/poketty1.4"
mkdir -p "$pkgdir/usr/bin"
cp poketty "$pkgdir/usr/bin/"

}
