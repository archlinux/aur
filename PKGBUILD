# Maintainer: Abhinav Pankajakshan <abhinavpankajakshan34@gmail.com>
pkgname=ttynote
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based text editor written in C"
arch=('x86_64')
source=("https://github.com/selfAnnihilator/ttynote/archive/refs/tags/v${pkgver}.tar.gz")
license=('MIT')
depends=()
makedepends=('gcc')
source=("ttynote.c" "Makefile" "ttynote.install")
install=ttynote.install
md5sums=('SKIP' 'SKIP' 'SKIP')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}
