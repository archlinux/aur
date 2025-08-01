pkgname=stutui
pkgver=1.0.0
pkgrel=4
pkgdesc="A minimalist terminal‐based study timer and stopwatch with daily logging, built on ncurses."
arch=('x86_64')
url="https://gitlab.com/sizinicin/stutui"
license=('GPL3')
packager="Arda Yılmaz <yilmaz.ar@proton.me>"
depends=('ncurses')
makedepends=('gcc')

source=("git+https://git@gitlab.com/sizinicin/stutui.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/stutui"
  gcc stutui.c -o stutui -lncurses
}

package() {
  install -Dm755 "$srcdir/stutui/stutui" "$pkgdir/usr/bin/stutui"
}
