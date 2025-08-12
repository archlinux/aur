# Maintainer: Arda Yılmaz <fijarom at fijarom dot com>

pkgname=fokus
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist terminal‐based focus timer and stopwatch with daily logging, built on ncurses."
arch=('x86_64')
url="https://sr.ht/~fijarom/fokus/"
license=('GPL3')
depends=('ncurses')
makedepends=('gcc')

source=("git+https://git.sr.ht/~fijarom/fokus")
sha256sums=('SKIP')

build() {
  cd "$srcdir/fokus"
  gcc fokus.c -o fokus -lncurses
}

package() {
  install -Dm755 "$srcdir/fokus/fokus" "$pkgdir/usr/bin/fokus"
}

