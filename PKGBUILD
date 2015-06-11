# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmblueclock
pkgver=3
pkgrel=1
pkgdesc="A clock dockapp (for WindowMaker, OpenBOx, AfterStep, etc.)"
arch=('i686' 'x86_64')
url="http://github.com/vampirefrog/wmblueclock"
license=('GPL')
depends=('libxpm' 'libxft')
makedepends=('git')
source=("$pkgname::git+https://github.com/vampirefrog/wmblueclock.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm0755 wmblueclock "$pkgdir/usr/bin/wmblueclock"
  install -Dm0644 wmblueclock.1 "$pkgdir/usr/share/man/man1/wmblueclock.1"
}

# vim: set sw=2 et:
