# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=epr-git
pkgver=2.3.0b
pkgrel=2
pkgdesc="CLI Epub Reader"
arch=(any)
url="https://github.com/wustho/epr"
license=(MIT)
depends=("ncurses")
makedepends=(git)
optdepends=()
provides=(epr)
conflicts=(epr)
source=("git+https://github.com/wustho/epr.git")
md5sums=("SKIP")

package() {
  cd "$srcdir/${pkgname/-git/}"
  mkdir -p "$pkgdir/usr/bin"
  cp epr.py "$pkgdir/usr/bin/epr"
}
