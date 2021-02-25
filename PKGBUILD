# Maintainer: sunflsks <sudhip@nashi.us>

pkgname=libgeneral
pkgver=54
pkgrel=1
pkgdesc="General stuff for tihmstar's projects - git version"
arch=('x86_64')
url="https://github.com/tihmstar/$pkgname"
license=('LGPL')
provides=('libgeneral')
conflicts=('libgeneral')
source=("https://github.com/tihmstar/libgeneral/archive/$pkgver.tar.gz")
md5sums=('318582e75dc02c9074aa8d59c265986a')

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
