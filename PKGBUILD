# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=usermount-git
pkgver=20200315
pkgrel=1
pkgdesc='Simple C program to automatically mount removable drives using UDisks2 and D-Bus.'
arch=('i686' 'x86_64')
url="https://github.com/tom5760/usermount"
license=('MIT')
depends=('udisks2' 'libnotify')
makedepends=('git')
source=('git+https://github.com/tom5760/usermount.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/usermount"
  make
}

package() {
  cd "$srcdir/usermount"
  install -D usermount "$pkgdir/usr/bin/usermount"
}

# vim:set ts=2 sw=2 et:
