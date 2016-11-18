
# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=sdlhana
pkgver=0.34
pkgrel=2
pkgdesc="SDL-based Hanafuda game"
arch=('i686' 'x86_64')
url="http://sdlhana.nongnu.org"
license=('GPL')
depends=('sdl' 'gcc-libs')
source=("http://nongnu.uib.no/$pkgname/$pkgname-$pkgver.tar.bz2")
sha1sums=('f6ce75fa8025795321fc1ca757f44a03ba1ca5e6')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
