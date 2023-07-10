# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=chinadns-ng-zfl9
_pkgbase=chinadns-ng
pkgver=2023.06.01
pkgrel=1
pkgdesc='chinadns next generation, refactoring with epoll and ipset'
arch=('x86_64' 'aarch64')
url="https://github.com/zfl9/chinadns-ng"
license=('GPL3')
provide=('chinadns-ng')
source=("$_pkgbase-$pkgver::https://github.com/zfl9/chinadns-ng/archive/refs/tags/2023.06.01.tar.gz")
sha512sums=('SKIP')

build() {
  cd $_pkgbase-$pkgver
  make DESTDIR=/usr/bin
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR=$pkgdir/usr/bin/ install
}
