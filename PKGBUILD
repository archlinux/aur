# Maintainer: Celio Grand <celiogrand@outlook.com>

pkgname=xcursor-blox
pkgver=1.3.0
pkgrel=1
pkgdesc="Blox XCursor Theme"
arch=('any')
url="https://limitland.de/bloxcursors"
license=('GPL3')
makedepends=('git' 'xorg-xcursorgen' 'librsvg' 'bc' 'python-lxml')
source=("git+https://gitlab.com/limitland/bloxcursors.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$srcdir/bloxcursors"
  export ICONSDIR="$pkgdir/usr/share/icons/"
  mkdir -p "$ICONSDIR"
  ./install-all
}
