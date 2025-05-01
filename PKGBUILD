# Maintainer: Celio Grand <celiogrand@outlook.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=xcursor-flatbed
pkgver=0.6.0
pkgrel=1
pkgdesc="Flatbed XCursor Theme"
arch=('any')
url="https://limitland.de/flatbedcursors"
license=('GPL3')
makedepends=('git' 'xorg-xcursorgen' 'librsvg' 'bc')
source=("git+https://gitlab.com/limitland/flatbedcursors.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$srcdir/flatbedcursors"
  export ICONSDIR="$pkgdir/usr/share/icons/"
  mkdir -p "$ICONSDIR"
  ./install-all
}
