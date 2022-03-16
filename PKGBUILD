# Maintainer: Devin J. Pohly <djpohly@gmail.com>
pkgname=stint-git
_pkgname=stint
pkgver=20120807
pkgrel=5
pkgdesc="Simple, suckless-style color grabber for X11"
arch=(i686 x86_64)
url="https://github.com/djpohly/stint"
license=('GPL')
depends=('libx11')
makedepends=('git')
provides=("$_pkgname")
source=('git+https://github.com/djpohly/stint.git')
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make destdir="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
