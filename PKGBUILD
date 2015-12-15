#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=libmxp
pkgver=0.2.4
pkgrel=2
pkgdesc="Mud eXtension Protocol library"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/games/kmuddy"
license=('GPL')
makedepends=('cmake')
provides=('libmxp')
source=("http://www.nboughton.uk/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('b28b280342492511bd5335b95ab3c59f')

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}

