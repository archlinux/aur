#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="XDG application menu with full support for FVWM"
pkgname=fvwm-xdg-menu
pkgver=r51
pkgrel=1
arch=(any)
license=(GPL2)
url="http://github.com/domichel/$pkgname"
groups=('xde')
depends=('gtk-update-icon-cache')
source=("$pkgname::git://github.com/domichel/$pkgname.git#commit=4b49473")
md5sums=('SKIP')
makedepends=('git')
install=$pkgname.install

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim: et sw=2:
