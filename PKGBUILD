# Maintainer: Bart De Roy <de dot roy dot bart at gmail dot com>
pkgname=shiftpressed
pkgver=1.0.0
pkgrel=1
pkgdesc='Detect if shift is pressed in the console'
arch=('any')
url='https://aur.archlinux.org/packages/shiftpressed'
license=('custom:Public Domain')
makedepends=('gcc')
source=(shiftpressed.c)
sha256sums=('f0c5327edf12f63eb74fe6a88928eb926664338eb7da60c8ebce80aabccb3645')

build() {
  cd $srcdir
  gcc -o shiftpressed shiftpressed.c
}

package() {
  cd $srcdir
  install -Dm755 shiftpressed "$pkgdir/usr/bin/shiftpressed"
}
