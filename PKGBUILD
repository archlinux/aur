# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: ziggi <xziggix@gmail.com>

pkgname=curseofwar
pkgver=1.3.0
pkgrel=1
pkgdesc='Fast-paced RTS/Action game with ncurses interface'
arch=('x86_64')
url='https://github.com/a-nikolaev/curseofwar/wiki'
license=('GPL')
depends=('ncurses')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/a-nikolaev/curseofwar/archive/v$pkgver.tar.gz")
sha512sums=('87d151af2a4eadbecd3f87867db8fb2277209e89a120443c9ee41065efc2004512f0b033626c2acddb98867eea6097c71b9aa7e4153f8b04b7b847682bc84705')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
