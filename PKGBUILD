# Maintainer: Francisco Domínguez Lerma <francisco.dominguez.lerma@gmail.com>
pkgname=poketty
pkgver=1.3
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
source=(http://hispagnu.org/poketty/releases/poketty1.3.tar.gz)
noextract=()
md5sums=('596fd5eb0ba01956aa8014ad2cbe2be3')

build() {
  cd "$srcdir/"
  gcc poketty.c -o poketty

}

package() {

cd "$srcdir/"
mkdir -p "$pkgdir/usr/bin"
cp poketty "$pkgdir/usr/bin/"

}
