pkgname=stutui
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist terminal‐based study timer and stopwatch with daily logging, built on ncurses."
arch=('x86_64')
url="https://gitlab.com/sizinicin/stutui"
license=('GPL3')
depends=('ncurses')
makedepends=('gcc')

source=("git+ssh://git@gitlab.com/sizinicin/stutui.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir"
  gcc stutui.c -o stutui -lncurses
}

package() {
  install -Dm755 stutui "$pkgdir/usr/bin/stutui"
}
