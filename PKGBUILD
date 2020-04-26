# Maintainer: Reberti Carvalho Soares <6reberti6@gmail.com>
pkgname=kyfm-git
provides=('kyfm')
pkgdesc="The fastest file manager."
pkgrel=1
pkgver=1.3.3de6f92d46
options=()
license=('GPLv2')
arch=('i686' 'x86_64')
depends=('ncurses' 'readline')
makedepends=('ncurses' 'readline')
groups=('file-management' 'suckless')
source=('git://github.com/KisuYami/kyfm')
url='www.github.com/KisuYami/kyfm'
md5sums=('SKIP')

build() {
  cd kyfm
  make
}

package() {
  cd kyfm

  mkdir -p "$pkgdir"/usr/bin/
  make DESTDIR="$pkgdir"/usr/bin/ install
}

# vim:set ts=2 sw=2 et:
