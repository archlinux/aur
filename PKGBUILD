# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmbluecpu
pkgver=4
pkgrel=1
pkgdesc="A CPU monitoring dockapp (for WindowMaker, OpenBOx, AfterStep and so on)"
arch=('i686' 'x86_64')
url="http://github.com/vampirefrog/wmbluecpu"
license=('GPL')
depends=('libxpm' 'libxft')
makedepends=('git')
source=("$pkgname::git+https://github.com/vampirefrog/wmbluecpu.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm0755 wmbluecpu "$pkgdir/usr/bin/wmbluecpu"
  install -Dm0644 wmbluecpu.1 "$pkgdir/usr/share/man/man1/wmbluecpu.1"
}

# vim: set sw=2 et:
