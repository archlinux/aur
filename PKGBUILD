# Maintainer: Ian Denhardt <ian@zenhack.net>
pkgname=pacsync-hg
pkgver=8
pkgrel=3
pkgdesc="A pacman frontend which manages packages based on a holistic view of the system"
arch=('any')
url="https://bitbucket.org/isd/pacsync"
license=('custom')
source=('http://bitbucket.org/isd/pacsync/get/tip.tar.bz2')

build() {
  :
}

package() {
  cd "$srcdir"/*-pacsync-*

  install -Dm755 pacsync $pkgdir/usr/bin/pacsync
  install -Dm644 pacsync.8 $pkgdir/usr/share/man/man8/pacsync.8
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -dm755 $pkgdir/etc/pacsync
}

# vim:set ts=2 sw=2 et:
md5sums=('21e9eba50b2727c7bde258b46c8349b2')
