# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmbluemem
pkgver=4
pkgrel=1
pkgdesc="A memory monitoring dockapp (for WindowMaker, OpenBOx, AfterStep etc)"
arch=('i686' 'x86_64')
url="http://github.com/vampirefrog/wmbluemem"
license=('GPL')
depends=('libxpm' 'libxft')
makedepends=('git')
source=("$pkgname::git+https://github.com/vampirefrog/wmbluemem.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm0755 wmbluemem "$pkgdir/usr/bin/wmbluemem"
  install -Dm0644 wmbluemem.1 "$pkgdir/usr/share/man/man1/wmbluemem.1"
}

# vim: set sw=2 et:
