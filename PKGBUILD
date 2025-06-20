# Maintainer: Abhinav Pankajakshan <abhinavpankajakshan34@gmail.com>
pkgname=ttynote
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based text editor written in C"
arch=('x86_64')
url="https://github.com/selfAnnihilator/ttynote"
license=('MIT')
depends=()
makedepends=('gcc')
source=("https://github.com/selfAnnihilator/ttynote/archive/refs/tags/v${pkgver}.tar.gz")
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
