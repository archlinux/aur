# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=chinadns-ng-zfl9
_pkgbase=chinadns-ng
pkgver=latest
pkgrel=1
pkgdesc='chinadns next generation, refactoring with epoll and ipset'
arch=('x86_64')
url="https://github.com/zfl9/chinadns-ng"
license=('GPL3')
depends=()
source=("_$pkgbase-$pkgver::https://github.com/zfl9/chinadns-ng/archive/refs/tags/latest.tar.gz")
sha512sums=('SKIP')

build() {
  cd _$pkgbase-$pkgver
  make DESTDIR=/usr/bin
}

package() {
  cd _$pkgbase-$pkgver
  make DESTDIR=$pkgdir/usr/bin/ install
}
