# Maintainer: minus <minus@mnus.de>

pkgname=jsq
pkgver=0.1.0
pkgrel=1
pkgdesc="Query JSON using JavaScript"
arch=('x86_64')
url="https://git.sr.ht/~minus/jsq"
license=('custom')
makedepends=('quickjs')
source=(
	"https://git.sr.ht/~minus/jsq/archive/v$pkgver.tar.gz"
)
sha256sums=('5f0663d744d7f8591beea46d60db8bdf66c4ff1013e455f19ceb8fb9ab3c09dc')

build() {
  cd "$srcdir/jsq-v$pkgver"

  make
}

package() {
  cd "$srcdir/jsq-v$pkgver"

  make install DESTDIR="$pkgdir" PREFIX=/usr
}
