# Maintainer: Thomas Baag <pkgbuild@spam.b2ag.de>
pkgname=ballerburg
pkgver=1.2.0
pkgrel=1
pkgdesc="Classical castle combat game"
arch=("x86_64")
url="http://baller.tuxfamily.org/"
license=('GPL')
groups=()
depends=('cmake')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://download.tuxfamily.org/baller/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ad8beb770dfa151a8c171a6beecf5a44')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
