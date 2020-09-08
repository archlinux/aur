# Maintainer: Ian Denhardt <ian@zenhack.net>
pkgname=pacsync-hg
pkgver=8
pkgrel=4
pkgdesc="A pacman frontend which manages packages based on a holistic view of the system"
arch=('any')
url="https://bitbucket.org/isd/pacsync"
license=('custom')
# TODO: should pin the exact version here -- but not really a huge rush, since
# this isn't actively developed...
source=('https://gitlab.com/isd/pacsync/-/archive/master/pacsync-master.tar.gz')

build() {
  :
}

package() {
  cd "$srcdir"/pacsync-master

  install -Dm755 pacsync $pkgdir/usr/bin/pacsync
  install -Dm644 pacsync.8 $pkgdir/usr/share/man/man8/pacsync.8
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -dm755 $pkgdir/etc/pacsync
}

# vim:set ts=2 sw=2 et:
sha256sums=('3cca7885a3579900fd7c69620c84f856eb40f25645642b43afa8d4bfbb0286e5')
