# Maintainer: Dusan Baran <work.dusanbaran@gmail.com>

pkgname=tagcat-git
pkgver=698638d
pkgrel=1
pkgdesc="Netcat but using broadcast to find open streams"
arch=('any')
url="https://github.com/dudoslav/tagcat.git"
license=('GPL3')
makedepends=('git' 'gcc')
source=("git+https://github.com/dudoslav/tagcat.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/tagcat"
  make
}

package() {
  cd "$srcdir/tagcat"
  DESTDIR=$pkgdir make install
}
